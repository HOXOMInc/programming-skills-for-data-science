# エクササイズ3: このエクササイズでは leaflet というライブラリを用いてインタラクティブな地図の可視化について学んでいきます

# `dplyr`と`leaflet`をロードして下さい


# RStudioのメニューからワーキングディレクトリを指定して下さい
# Session > Set Working Directory > To Source File Location


# `read.csv()`を用いて、`populations`という変数に`data/uscitiesv1.4.csv`をロードして下さい

  
# `leaflet`は数千の点しかレンダリング出来ないため、`top_n()`を用いてトップ１０００の人口の行を抽出し、`most_populous`という変数に代入して下さい


# ベースとなるレイヤーマップを作成するために、`most_populous`データフレームを`leaflet()`の引数として実行して下さい
# 続いて`add_tiles()`を実行してマップタイルを追加して下さい
# これによってブランクな地図が作成されます
# 実行結果は`map`という変数に代入して下さい


# `addCircleMarkers()`を用いて地図にマーカーを重ね書きして下さい
# `addCircleMarkers()`の引数は以下のように設定して下さい
# - `lat`: `lat`
# - `lng`: `lng`
# - `popup`: `city`
# - `stroke`: `FALSE`
# - `radius`: 1
# - `fillOpacity`: .5


# 各都市のマーカーのサイズを人口に比例させたい場合は、各マーカーに必要なピクセル数を計算する必要があります
# `mutate()`を用いて`most_populous`データフレームに新しい列として`radius`という列を作成して下さい
# この時、`radius`の値を`population/max(population) * 3)^2`として下さい


# このグラフをパイプ(%>%)を用いて一行で書き直して下さい
