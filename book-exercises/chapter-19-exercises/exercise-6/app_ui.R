# 必要なライブラリをロードする
library(plotly)
library(shiny)

# ui関数を定義する
ui <- fluidPage(
  mainPanel(
    # `selectInput()`を用いてセレクトボックスを定義して下さい
    # この時、ラベル(lable)は"Variable to Map"、選択肢(choices)は
    # list("Population" = "population", "Electoral Votes" = 
    # "votes", "Votes / Population" = "ratio")),として下さい
    selectInput(
      "mapvar", 
      label = "Variable to Map", 
      choices = list(
                  "Population" = "population", 
                  "Electoral Votes" = "votes", 
                  "Votes / Population" = "ratio"
      )
    ),
    
    # `plotlyOutput()`を用いて地図を描画して下さい
    plotlyOutput("map")
  )
)
