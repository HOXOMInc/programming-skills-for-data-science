# エクササイズ3: このエクササイズではユーザインターフェース（UI）関数とサーバ関数を定義してShinyアプリを作成します

# `shiny`, `ggplot2`, `dplyr`をロードする
library("shiny")
library("ggplot2")
library("dplyr")

# `ggplot2`で提供されている`diamonds`データセットを対象に、`sample_n()`を用いてランダムに1000行抽出し、`diamonds_sample`という変数に代入する
diamonds_sample <- sample_n(diamonds, 1000)

# `price_range`という変数に、`range()`を用いてダイヤモンドの価格のレンジを代入して下さい
price_range <- range(diamonds$price)

# `select_values`という変数に、`colnames()`を用いてデータセットの列名を代入して下さい
select_values <- colnames(diamonds)

#### コードを綺麗に管理するために、UI関数の要素をUI関数の外で定義します

# `price_input`という変数に、`sliderInput()`で定義するウィジェットを代入して下さい
# この時、引数は以下のように設定して下さい
# - inputId: `price_choice`
# - label: "Price (in dollars)"
# - min: price_range[1]
# - max: price_range[2]
# - value: price_range
price_input <- sliderInput(
  inputId = "price_choice",
  label = "Price (in dollars)",
  min = price_range[1],
  max = price_range[2],
  value = price_range
)

# `feature_input`という変数に、`selectInput()`で定義するウィジェットを代入して下さい
# この時、引数は以下のように設定して下さい
# - inputId: `feature`
# - label: "Feature of Interest"
# - choices: select_values
# - selected: carat
feature_input <- selectInput(
  inputId = "feature",
  label = "Feature of Interest",
  choices = select_values,
  selected = "carat"
)

# `ui`という変数にUIを定義して代入して下さい
# この時、`fluidPage()`を用いてUIを定義して下さい
# `fluidPage()`に渡す引数は以降の行で定義していきます
ui <- fluidPage(

  # `titlePanel()`を用いて"Diamond Viewer"という文字列のタイトルを作成して下さい
  titlePanel("Diamond Viewer"),

  # `prince_input`
  price_input,

  # `feature_input`
  feature_input,
  
  # `checkboxInput()`を用いてチェックボックスを作成して下さい
  # この時、`label`引数は"Show Trendline"、デフォルト値はTRUEとして下さい
  checkboxInput("smooth", label = strong("Show Trendline"), value = TRUE),

  # `plotOutput()`を用いて、`plot`を表示して下さい
  plotOutput("plot")
)

# `server`という関数にサーバ関数を定義して下さい
# サーバ関数の処理内容は以降で定義していきます
server <- function(input, output) {

  # `renderPlot()`を用いて`plot`に値を代入して下さい
  output$plot <- renderPlot({

    # `filter()`を用いて`price_choice`の結果をベースに`diamonds_sample`データを価格でフィルタリングして下さい
    plot_data <- diamonds_sample %>%
      filter(price > input$price_choice[1], price < input$price_choice[2])

    # `ggplot`の関数を用いてx軸を選択した列(input$feature)、y軸を価格(price)、色を`color`とする散布図を作成して下さい
    p <- ggplot(
      data = plot_data,
      mapping = aes_string(x = input$feature, y = "price", color = "cut")
    ) +
      geom_point()

    # トレンドラインのチェックボックスが選択されている場合、`geom_smooth()`を用いてトレンドラインを描画して下さい
    # この時、`se=FALSE`と設定して下さい
    # ヒント: if文を用いて、トレンドラインを描画する、描画しないをスイッチ出来るようにしましょう
    if (input$smooth) {
      p <- p + geom_smooth(se = FALSE)
    }
  
    # 関数の最終行に返り値となる変数を記載して下さい
    p
  })
)

# `ui`と`server`を`shinyApp()`の引数としてShinyアプリを作成して下さい
shinyApp(ui = ui, server = server)
