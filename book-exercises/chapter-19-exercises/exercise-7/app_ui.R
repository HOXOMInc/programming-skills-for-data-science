# 必要なライブラリをロードします
library(shiny)
library(plotly)


# `sidebarPanel()`を用いてサイドバーパネルを定義し、`map_sidebar_content`に代入して下さい
# この時、ラベル(label)を"Variable to Map"、選択肢(choices)を以下のリストにして下さい
# list(
#      "Population" = "population",
#      "Electoral Votes" = "votes",
#      "Votes / Population" = "ratio"
#    )
map_sidebar_content <- sidebarPanel(
  selectInput(
    "mapvar",
    label = "Variable to Map",
    choices = list(
      "Population" = "population",
      "Electoral Votes" = "votes",
      "Votes / Population" = "ratio"
    )
  )
)

# `mainPanel()`を用いてメインパネルを定義し、`map_main_content`に代入して下さい
# メインパネルでは`plotlyOutput()`を用いて地図を表示して下さい
map_main_content <- mainPanel(
  plotlyOutput("map")
)

# `tabPanel()`を用いて地図を描画するUIを定義し、`map_panel`に代入して下さい
map_panel <- tabPanel(
  "Map",
  titlePanel("Electoral College Votes"),
  # `sidebarLayout()`を用いて以下の二つのUIを表示して下さい
  sidebarLayout(
    # `map_sidebar_content`を表示して下さい
    map_sidebar_content,
    
    # `map_main_content`を表示して下さい
    map_main_content
  )
)

# `sidebarPanel()`を用いてサイドバーパネルを定義し、`scatter_sidebar_content`に代入して下さい
# サイドバーパネルでは、`textInput()`を用いて州を文字列で検索するためのウィジェットを作成して下さい
scatter_sidebar_content <- sidebarPanel(
  textInput("search", label = "Find a State", value = "")
)

# `mainPanel()`を用いてメインパネルを定義し、`scatter_main_content`に代入して下さい
# メインパネルでは`plotlyOutput()`を用いて地図を表示して下さい
scatter_main_content <- mainPanel(
  plotlyOutput("scatter")
)

# `tabPanel()`を用いて散布図を描画するUIを定義し、`scatter_panel`に代入して下さい
scatter_panel <- tabPanel(
  "Scatter",
  
  # `titlePanel()`を用いて "Population v.s. Vote Power"を文字列とするタイトルを表示して下さい
  titlePanel("Population v.s. Vote Power"),
  
  # `sidebarLayout()`を用いて以下の二つのUIを表示して下さい
  sidebarLayout(
    
    # `scatter_sidebar_content`を表示して下さい
    scatter_sidebar_content,
    
    # `scatter_main_content`を表示して下さい 
    scatter_main_content
  )
)
   
# `navbarPage()`を用いて、`map_panel`と`scatter_panel`を要素とするUIを定義し、`ui`という変数に代入して下さい
# この時、`navbarPage()`のタイトルは"Electoral College"として下さい
ui <- navbarPage(
  "Electoral College",
  map_panel, 
  scatter_panel
)
