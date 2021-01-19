# エクササイズ2: このエクササイズではユーザインターフェース（UI）関数とサーバ関数を定義してShinyアプリを作成します

# `shiny`パッケージをロードして下さい
library("shiny")

# `ui`という変数にUIを定義して代入して下さい
# この時、`fluidPage()`を用いてUIを定義して下さい
# `fluidPage()`に渡す引数は以降の行で定義していきます
ui <- fluidPage(
  
  # `titlePanel()`を用いてアプリのタイトルを作成して下さい
  # この時、タイトルは"Cost Calculator"として下さい
  titlePanel("Cost Calculator"),
  
  # `numericInput()`を用いて数値を入力するためのウィジェットを作成して下さい
  # この時、ウィジェットのラベルは"Price (in dollars)"、デフォルトの値は`0`、入力の最小値は`0`として下さい
  # `numericInput()`について詳しく知りたい場合はドキュメントを調べてみましょう！
  numericInput("price", label = "Price (in dollars)", value = 0, min = 0),
  
  # `numericInput()`を用いて数値を入力するためのウィジェットを作成して下さい
  # この時、ウィジェットのラベルは"Quantity"、デフォルトの値は`1`、入力の最小値は`1`として下さい
  numericInput("quantity", label = "Quantity", value = 1, min = 1),
  
  # `strong()`を用いて太文字で"Cost"という文字列を表示して下さい
  strong("Cost"),
  
  # `textOutput()`を用いて`cost`というラベルのついた値を表示して下さい
  textOutput("cost")
)

# `server`という関数にサーバ関数を定義して下さい
# サーバ関数の処理内容は以降で定義していきます
server <- function(input, output) {

  # `renderText()`を用いてコスト（`output$cost`）を計算して下さい
  # コストは価格("Price")と数量("Quantity")を掛け合わせたものとして下さい
  # 加えて、`paster0()`を用いてコストの前に"$"という文字列を加えて下さい
  output$cost <- renderText({
    return(paste0("$", input$price * input$quantity))
  })
}

# `ui`と`server`を`shinyApp()`の引数としてShinyアプリを作成して下さい
shinyApp(ui = ui, server = server)
