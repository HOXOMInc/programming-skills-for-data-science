# 必要なライブラリをロードする
library(plotly)
library(stringr)

### 散布図を作成する ###
build_scatter <- function(data,  search = "", xvar = "population", yvar = "votes") {
  # xとyの最大値を取得する
  xmax <- max(data[,xvar]) * 1.5
  ymax <- max(data[,yvar]) * 1.5
  
  # 検索単語に応じてデータをフィルタリングする
  data <- data %>% 
    filter(grepl(search, state))
  
  # 散布図を描画する
  p <- plot_ly(x = data[, xvar],
            y = data[, yvar], 
            mode="markers", 
            marker = list(
              opacity = .4, 
              size = 10
            )) %>% 
    layout(xaxis = list(range = c(0, xmax), title = xvar), 
           yaxis = list(range = c(0, ymax), title = yvar)
    )
  return(p)
}
