# Interactive Visualization in Action: シアトル市の変化を探る

# 必要なパッケージをロードする
library(plotly)
library(dplyr)
library(leaflet)

# 分析対象のデータをロードする
# このデータは https://data.seattle.gov/Permitting/Building-Permits/76t5-zqzr からダウンロード出来る
all_permits <- read.csv("data/Building_Permits.csv", stringsAsFactors = FALSE)

# 2010年以降の新規の建設許可を抽出する
new_buildings <- all_permits %>%
  filter(
    PermitTypeDesc == "New",
    PermitClass != "N/A",
    as.Date(all_permits$IssuedDate) >= as.Date("2010-01-01") # 日付で抽出する
  )

# 建設許可が出された年をカラムとして追加する
new_buildings <- new_buildings %>%
  mutate(year = substr(IssuedDate, 1, 4)) # 日付データから年を抽出する

# 年別の建設許可数をカウントする
by_year <- new_buildings %>%
  group_by(year) %>%
  count()

# plotlyを用いてインタラクティブなデータ可視化を実現する
plot_ly(
  data = by_year, # 対象のデータフレームを指定する
  x = ~year,      # x軸を指定する
  y = ~n,         # y軸を指定する
  type = "bar",   # データ可視化の手法として棒グラフを指定する
  alpha = .7,     # 透過度を指定する
  hovertext = "y" # グラフにマウスをホバーするとy軸の値を表示する
) %>%
  layout(
    title = "Number of new building permits per year in Seattle",
    xaxis = list(title = "Year"),
    yaxis = list(title = "Number of Permits")
  )

# Leafletを用いてマップタイルと円マーカーを指定して地図を描画する
leaflet(data = new_buildings) %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(lng = -122.3321, lat = 47.6062, zoom = 10) %>%
  addCircles(
    lat = ~Latitude, # 緯度を指定する
    lng = ~Longitude, # 経度を指定する
    stroke = FALSE, # 円マーカーの枠線を削除する
    popup = ~Description # ポップアップを指定する
  )

# 建設許可の種別に応じて色分けするための関数を作成する
# この時、カラーパレットにColorBrewerのSet3を指定する
palette_fn <- colorFactor(palette = "Set3", domain = new_buildings$PermitClass)

# Leafletパッケージを用いて新規の建設許可を可視化する
leaflet(data = new_buildings) %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(lng = -122.3321, lat = 47.6062, zoom = 10) %>% 
  addCircles(
    lat = ~Latitude, # 緯度を指定する
    lng = ~Longitude, # 経度を指定する
    stroke = FALSE, # 円マーカーの枠線を削除する
    popup = ~Description, # ポップアップを指定する
    color = ~palette_fn(PermitClass), # palette_fn()を用いて色分けを指定する
    radius = 20, # 円マーカーの半径を指定する
    fillOpacity = 0.5 # 透過度を指定する
  ) %>%
  addLegend( # 地図の右下に凡例を配置する
    position = "bottomright",
    title = "New Buildings in Seattle",
    pal = palette_fn,
    values = ~PermitClass,
    opacity = 1
  )

