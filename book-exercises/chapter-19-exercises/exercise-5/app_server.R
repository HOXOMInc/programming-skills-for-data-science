# エクササイズ5
library(shiny)
library(ggplot2)

# 散布図を描画するサーバ関数を定義して下さい
# `input`には`x_var`, `y_var`, `color`, `size`を用いて下さい
# また、`renderPlot()`を用いて、散布図の描画結果を`output$scatter`という変数に代入して下さい
server <- function(input, output) {
  output$scatter <- renderPlot({
    
    # タイトルを変数に代入する
    title <- paste0("MPG Dataset: ", input$x_var, " v.s.", input$y_var)
    
    # ggplotを用いて散布図を作成する
    p <- ggplot(mpg) +
      geom_point(mapping = aes_string(x = input$x_var, y = input$y_var), 
        size = input$size, 
        color = input$color) +
      labs(x = input$x_var, y = input$y_var, title = title)
    p
  })
}
