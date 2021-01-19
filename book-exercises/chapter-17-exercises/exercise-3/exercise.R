# エクササイズ3: このエクササイズでは leaflet というライブラリを用いてインタラクティブな地図の可視化について学んでいきます

# `dplyr`と`leaflet`をロードして下さい
library("dplyr")
library("leaflet")

# RStudioのメニューからワーキングディレクトリを指定して下さい
# Session > Set Working Directory > To Source File Location


# `read.csv()`を用いて、`populations`という変数に`data/uscitiesv1.4.csv`をロードして下さい
populations <- read.csv(
  file = "data/uscitiesv1.4.csv",
  stringsAsFactors = FALSE
)
  
# `leaflet`は数千の点しかレンダリング出来ないため、`top_n()`を用いてトップ１０００の人口の行を抽出し、`most_populous`という変数に代入して下さい
most_populous <- populations %>% 
  top_n(1000, wt = population)

# ベースとなるレイヤーマップを作成するために、`most_populous`データフレームを`leaflet()`の引数として実行して下さい
# 続いて`add_tiles()`を実行してマップタイルを追加して下さい
# これによってブランクな地図が作成されます
# 実行結果は`map`という変数に代入して下さい
map <- leaflet(most_populous)  %>% 
  addTiles() 

# `addCircleMarkers()`を用いて地図にマーカーを重ね書きして下さい
# `addCircleMarkers()`の引数は以下のように設定して下さい
# - `lat`: `lat`
# - `lng`: `lng`
# - `popup`: `city`
# - `stroke`: `FALSE`
# - `radius`: 1
# - `fillOpacity`: .5
map %>% addCircleMarkers(
    lat = ~lat, # specify the column for `lat` as a formula
    lng = ~lng, # specify the column for `lng` as a formula
    popup = ~city, # show the description in a popup
    stroke = FALSE, # remove border from each circle
    radius = 1,
    fillOpacity = 0.5
  )

# 各都市のマーカーのサイズを人口に比例させたい場合は、各マーカーに必要なピクセル数を計算する必要があります
# `mutate()`を用いて`most_populous`データフレームに新しい列として`radius`という列を作成して下さい
# この時、`radius`の値を`population/max(population) * 3)^2`として下さい
most_populous <- most_populous %>% 
  mutate(radius = (population/max(population) * 3)^2)

# このグラフをパイプ(%>%)を用いて一行で書き直して下さい
leaflet(most_populous)  %>% 
  addTiles() %>% 
  addCircleMarkers(
    lat = ~lat, # specify the column for `lat` as a formula
    lng = ~lng, # specify the column for `lng` as a formula
    stroke = FALSE, # remove border from each circle
    popup = ~city, # show the description in a popup
    radius = ~radius,
    fillOpacity = 0.5
  )
