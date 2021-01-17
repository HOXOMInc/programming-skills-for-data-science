# `shiny`と`ggplot2`をロードします
library("shiny")
library("ggplot2")

# `read.csv()`でCSVファイルをロードします
income_growth <- read.csv("data/income_growth_1980-2014.csv")

# サーバ関数を定義します
server <- function(input, output) {
  output$plot <- renderPlot({
    # グラフを返り値とします
    ggplot(data = income_growth) +
      geom_point(mapping = aes(
        x = Income.Percentile, y = Average.Growth.Perc
      ), color = "gray") +
      geom_point(mapping = aes(
        x = Income.Percentile, y = Post.Tax.Growth.Perc
      ), color = "red") +
      labs(x = "Income Percentile", y = "Income Growth (%)") +
      scale_x_continuous(limits = input$percentile)
  })
}
