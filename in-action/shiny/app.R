# 必要なパッケージをロードする
library(shiny)
library(dplyr)
library(leaflet)

# 分析対象のデータをロードする
shootings <- read.csv("data/police-shootings.csv", stringsAsFactors = FALSE)

# 地図とテーブルを表示するUI関数を定義する
my_ui <- fluidPage(
  # アプリのタイトル
  titlePanel("Fatal Police Shootings"),
  sidebarLayout(
    # セレクトボックスを表示する
    sidebarPanel(
      selectInput(
        inputId = "analysis_var",
        label = "Level of Analysis",
        choices = c("gender", "race", "body_camera", "threat_level")
      )
    ),
    # メインパネルに地図とテーブルを表示する
    mainPanel(
      leafletOutput("shooting_map"), # leafletのリアクティブアウトプット
      tableOutput("grouped_table")   # tableのリアクティブアウトプット
    )
  )
)

# 地図とテーブルをレンダリングするサーバ関数を定義する
my_server <- function(input, output) {
  # UIでレンダリングするための地図を定義する
  output$shooting_map <- renderLeaflet({
    # カラーパレットを定義する
    palette_fn <- colorFactor(palette = "Dark2", domain = shootings[[input$analysis_var]])
    
    # 地図を作成し返り値とする
    leaflet(data = shootings) %>%
      addProviderTiles("Stamen.TonerLite") %>% # Stamenマップタイルを指定する
      addCircleMarkers( # 円マーカーを地図に追加する
        lat = ~lat,
        lng = ~long,
        label = ~paste0(name, ", ", age), # 被害者の名前と年齢をラベルとして追加する
        color = ~palette_fn(shootings[[input$analysis_var]]), # `input$analysis_var`の値に応じて円マーカーの色を指定する
        fillOpacity = .7,
        radius = 4,
        stroke = FALSE
      ) %>%
      addLegend( # 凡例を追加する
        "bottomright",
        title = "race",
        pal = palette_fn, # 凡例の色を指定する
        values = shootings[[input$analysis_var]], # 凡例の値を指定する
        opacity = 1 # 凡例を不透明に指定する
      )
  })
  
  # UIでレンダリングするためのテーブルを定義する
  output$grouped_table <- renderTable({
    table <- shootings %>%
      group_by(shootings[[input$analysis_var]]) %>%
      count() %>%
      arrange(-n)
    colnames(table) <- c(input$analysis_var, "Number of Victims") # カラム名をフォーマットする
    
    table # table変数を返り値とする
  })
}
# アプリを実行する
shinyApp(ui = my_ui, server = my_server)
