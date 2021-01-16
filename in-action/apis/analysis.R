# APIs in Action: シアトルのキューバレストラン

# 必要なパッケージをロードする
library(httr)
library(jsonlite)
library(dplyr)
library(ggrepel)

# ggmapの開発中のバージョンをインストール・ロードする
library(devtools) # GitHubからパッケージをインストールする
devtools::install_github("dkahle/ggmap", ref = "tidyup")
library(ggmap)

# Google API Keyを登録する
# https://developers.google.com/maps/documentation/geocoding/get-api-key
register_google(key="YOUR_GOOGLE_KEY")

# Yelp APIキーを"api_key.R"からロードする
source("api_key.R") # ロードすることで`yelp_key`変数が使えるようになる

# Yelp Fusion API's Business Searchエンドポイントの検索クエリを作成する
base_uri <- "https://api.yelp.com/v3"
endpoint <- "/businesses/search"
search_uri <- paste0(base_uri, endpoint)

# クエリ変数を代入する
query_params <- list(
  term = "restaurant",
  categories = "cuban",
  location = "Seattle, WA",
  sort_by = "rating",
  radius = 8000 # ドキュメントに記載あるようにradiusの単位はメートルとなっている
)

# APIキーとクエリ変数を用いてGETリクエストを作成する
response <- GET(
  search_uri,
  query = query_params,
  add_headers(Authorization = paste("bearer", yelp_key))
)

# リクエストの結果をパースする
response_text <- content(response, type = "text")
response_data <- fromJSON(response_text)

# `response_data`変数の内容を調査する
names(response_data) # [1] "businesses" "total" "region"

# flatten()を用いて`response_data$businesses`をデータフレームに変換する
restaurants <- flatten(response_data$businesses)

# データフレームに必要な列を追加する
restaurants <- restaurants %>%
  mutate(rank = row_number()) %>% # 行数をランクとする
  mutate(name_and_rank = paste0(rank, ". ", name))

# 地図のベースとなるレイヤーを作成する（シアトルのGoogle Maps画像）
base_map <- ggmap(
  get_map(
    location = c(-122.3321, 47.6062),
    zoom = 11,
    source = "google")
)

# 地図にラベルを付与する
base_map + geom_label_repel(
  data = restaurants,
  aes(x = coordinates.longitude, y = coordinates.latitude, label = name_and_rank)
)
