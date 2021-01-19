# エクササイズ1: このエクササイズではShinyフレームワークを用いてシンプルなユーザインターフェース（UI）を作成します

# `shiny`パッケージをロードして下さい
# もし`shiny`パッケージをインストールしていなければターミナルからインストールしておいて下さい
library("shiny")

# `ui`という変数にUIを定義して代入して下さい
# この時、`fluidPage()`を用いてUIを定義して下さい
# `fluidPage()`に渡す引数は以降の行で定義していきます
ui <- fluidPage(
  
  # `h1()`を用いてレベル１のヘッダを作成して下さい
  # この時、ヘッダの内容は"First Shiny Website"として下さい
  h1("First Shiny Website"),
  
  # `p()`を用いて文章を作成して下さい
  # この時、文章の内容はあなたがShinyでアプリを作っている時の興奮を表現して下さい
  # また、文章の中で`strong()`を用いるようにして下さい
  p("This is my", strong("first"), "shiny project, and I feel..."),

  # `img()`を用いて画像を挿入して下さい
  # この時、画像のURLは以下を指定して下さい
  # https://media2.giphy.com/media/l3q2Ip7FrmPE33EiI/giphy.gif
  img("", src = "https://media2.giphy.com/media/l3q2Ip7FrmPE33EiI/giphy.gif"),

  # `p()`を用いて文章を作成して下さい
  # この時、文章の内容はあなたがスライダーを使える興奮を表現して下さい
  # また、文章の中で`em()`を用いるようにして下さい
  p("I can't wait to get", em("sliders"), "like these to work."),

  # `sliderInput()`を用いてスライダーを作成して下さい
  # この時、keyは`my_slider`、minは`10`、maxは`100`、デフォルトの値は`50`として下さい
  sliderInput("my_slider", "My First Slider", min = 0, max = 100, value = 50)

  # `fluidLayout()`をここで終了して下さい
)

# 今回のエクササイズではサーバ関数は何もしませんが、Shinyアプリを作成するため必要になります
server <- function(input, output) {
  # 次回以降のエクササイズでサーバ関数を定義していきます！
}

# `ui`と`server`を`shinyApp()`の引数としてShinyアプリを作成して下さい
shinyApp(ui = ui, server = server)
