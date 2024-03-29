# 必要なライブラリをロードします
library(plotly)
library(stringr)

# 地図を描画する関数を定義します
# 参考: https://plot.ly/r/choropleth-maps/

build_map <- function(data, map_var) {
  # 州の境界に白い枠線を引きます
  l <- list(color = toRGB("white"), width = 2)
  
  # 地図のオプションを指定します
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  
  # 地図を描画する
  p <- plot_geo(data, locationmode = 'USA-states') %>%
    add_trace(
      z = data[, map_var], text = ~state, locations = ~code,
      color = data[, map_var], colors = 'Purples'
    ) %>%
    colorbar(title = "Color Title") %>%
    layout(
      title = str_to_title(map_var),
      geo = g
    )
   return(p)
}
