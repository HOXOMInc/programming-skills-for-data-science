# `shiny`ライブラリをロードします
library("shiny")

### コードを綺麗に管理するために、UIの要素をUI関数の外部で定義しておきます

# `intro_panel`という変数に、`tabPanel()`で定義したUIを代入して下さい
# この時、titleを"Introduction"として下さい
# その他のレイアウトは関数の中で定義していきます
intro_panel <- tabPanel(
  "Introduction",
  
  # `titlePanel()`でタイトルパネルを表示して下さい
  # この時、引数の文字列は"Income Inequality"として下さい
  titlePanel("Income Inequality"),
  
  # `p()`を用いて文字列を表示して下さい
  # この時、引数の文字列は"The below diagram was created by the 
  # New York Times to illustrate the increasing level of inequality in
  # the US."として下さい
  p("The below diagram was created by the New York Times to illustrate the
    increasing level of inequality in the US."),

  # `img()`を用いて画像を表示して下さい
  # この時、表示する画像は`www/`フォルダの`inequality.png`として下さい
  img(src = "inequality.png"),

  # `p()`と`a()`を用いて以下のハイパーリンクを表示して下さい
  # https://www.nytimes.com/interactive/2017/08/07/opinion/leonhardt-income-inequality.html
  p(a(href = "https://www.nytimes.com/interactive/2017/08/07/opinion/leonhardt-income-inequality.html", "(source)")),

  # `p()`を用いて図を説明して下さい
  # 説明文の一部で、`strong()`と`em()`をそれぞれ一回以上用いて下さい
  p(
    "The graph shows how the richest 1% of people have seen their incomes jump",
    strong("6%"),
    "since 1980",
    "while the bottom 60% have barely seen any increase",
    em("(their income has stagnated).")
  ),

  p('Click on the "Growth Chart" tab to see an interactive diagram.')
)

### 続いて、二つ目のパネルのUIを定義していきます

# `sidebar_content`という変数に、`sidebarPanel()`で定義したUIを代入して下さい
sidebar_content <- sidebarPanel(

  # `sliderInput()`を用いてスライダーを定義して下さい
  # この時、`inputId`を`percentil`、`label`を"Income Percentile"として下さい
  # また、スライダーでは0から１００までの値を選べるようにして下さい
  sliderInput(
    inputId = "percentile",
    label = "Income Percentile", min = 0, max = 100, value = c(0, 100)
  )
)

# `main_contentという変数に、`mainPanel()`で定義したUIを代入して下さい
main_content <- mainPanel(
  
  # `plotOutput()`を用いてサーバ関数の`plot`を表示して下さい
  plotOutput("plot"),

  # `p()`と`a()`を用いて以下のハイパーリンクを表示して下さい
  # http://gabriel-zucman.eu/usdina/
  p(
    "Source:",
    a(
      href = "http://gabriel-zucman.eu/usdina/",
      "http://gabriel-zucman.eu/usdina/"
    )
  )
)

# `growth_panel`という変数に、`tabPanel()`で定義したUIを代入して下さい
# この時、titleを"Growth Chart"として下さい
# その他のレイアウトは関数の中で定義していきます
growth_panel <- tabPanel(
  "Growth Chart",

  # `titlePanel()`でタイトルパネルを表示して下さい
  # この時、引数の文字列は"Income growth 1980-2014"として下さい
  titlePanel("Income growth 1980-2014"),

  # `sidebarLayout()`を用いて二つのカラムを作成して下さい
  # サイドバーレイアウトは以下の二つのコンテンツを表示します
  sidebarLayout(
    
    # `sidebar_content`を表示して下さい
    sidebar_content,
    
    # `main_content`を表示して下さい
    main_content
  )
)
    

# `ui`変数に、`navbarPage()`で定義したUIを代入して下さい
# `ui`変数は、`app.R`で呼び出されてUIを定義するのに用いられます
# この時、タイトルは"Income Inequality"として下さい
# また、`navbarPage()`の要素は`intro_panel`と`growth_panel`として下さい
ui <- navbarPage(
  "Income Inequality",
  intro_panel,
  growth_panel
)
