# ggplot2 in Action: サンフランシスコでの立ち退きの可視化

# データラングリングとデータ可視化に必要なパッケージをロードする
library("dplyr")
library("tidyr")

# ggmapの開発中のバージョンをインストール・ロードする
library(devtools) # GitHubからパッケージをインストールする
devtools::install_github("dkahle/ggmap", ref = "tidyup")
library(ggmap)

# .csvファイルを読み込む
# このデータは https://catalog.data.gov/dataset/eviction-notices からダウンロード出来る
eviction_notices <- read.csv("data/Eviction_Notices.csv", stringsAsFactors = F)

# データラングリング: 日付のフォーマット、2017年のデータを抽出、緯度/経度データの抽出
notices <- eviction_notices %>%
  mutate(date = as.Date(File.Date, format="%m/%d/%y")) %>%
  filter(format(date, "%Y") == "2017") %>%
  separate(Location, c("lat", "long"), ", ") %>% # コンマ(,)で分割する
  mutate(
    lat = as.numeric(gsub("\\(", "", lat)), # 括弧を除去する
    long = as.numeric(gsub("\\)", "", long)) # 括弧を除去する
  ) 

# サンフランシスコの地図上に立ち退き命令があった箇所を描画する

# Google API Keyを登録する
# https://developers.google.com/maps/documentation/geocoding/get-api-key
register_google(key="YOUR_GOOGLE_KEY")

# マップタイルの背景を作成する
base_plot <- qmplot(
  data = notices,               # データフレームを指定する
  x = long,                     # 経度を指定する
  y = lat,                      # 緯度を指定する
  geom = "blank",               # データポイントを表示しない設定にする
  maptype = "toner-background", # マップタイルを指定する
  darken = .7,                  # 地図を暗くする
  legend = "topleft"            # 凡例の位置を指定する
)

# 立ち退き命令があった箇所を地図に追加する
base_plot +
  geom_point(mapping = aes(x = long, y = lat), color = "red", alpha = .3) +
  labs(title = "Evictions in San Francisco, 2017") +
  theme(plot.margin = margin(.3, 0, 0, 0, "cm")) # 地図の間隔を調整する

# ggplot2を用いて立ち退き命令のヒートマップを描画する
base_plot +
  geom_polygon(
    stat = "density2d",
    mapping = aes(fill = stat(level)),
    alpha = .3
  ) +
  scale_fill_gradient2("# of Evictions", low = "white", mid = "yellow", high = "red") +
  labs(title="Number of Evictions in San Francisco, 2017") +
  theme(plot.margin = margin(.3, 0, 0, 0, "cm"))
