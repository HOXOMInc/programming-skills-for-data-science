# `shiny`と`ggplot2`をロードする
library(shiny)
library(ggplot2)

# `select_values`という変数に、`colnames()`を用いて`mpg`データセットの列名を代入して下さい


# `x_input`という変数に、`selectInput()`で定義したUIを代入して下さい
# この時、セレクトボックスのラベル(label)を`X Variable`、選択肢(choices)を`select_values`、初期値(selected)を`displ`として下さい


# `y_input`という変数に、`selectInput()`で定義したUIを代入して下さい
# この時、セレクトボックスのラベル(label)を`Y Variable`、選択肢(choices)を`select_values`、初期値(selected)を`cyl`として下さい


# `color_input`という変数に、`selectInput()`で定義したUIを代入して下さい
# この時、セレクトボックスのラベル(label)を`Color`、選択肢(choices)を`list("Red" = "red", "Blue" = "blue", "Green" = "green")`として下さい


# `size_input`という変数に、`selectInput()`で定義したUIを代入して下さい
# この時、セレクトボックスのラベル(label)を`Size of point`、最小値(min)を`1`、最大値(max)を`10`、値(value)を`5`として下さい


# `ui`変数に、`fluidPage()`で定義したUIを代入して下さい
# `ui`変数は、`app.R`で呼び出されてUIを定義するのに用いられます


  # `h1()`を用いてこのアプリを表現するタイトルを表示して下さい


  # `x_input`を表示して下さい

  
  # `y_input`を表示して下さい

  
  # `color_input`を表示して下さい

  
  # `size_input`を表示して下さい


  # `plotOutput()`を用いてグラフを表示して下さい

