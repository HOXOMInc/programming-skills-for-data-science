# エクササイズ1: このエクササイズではウェブAPIの使い方を学んでいきます

# `httr`, `jsonlite`, `dplyr`パッケージをロードします
library("httr")
library("jsonlite")
library("dplyr")

# `base_uri`という変数にGitHub APIのベースURI(https://api.github.com)を代入して下さい
base_uri <- "https://api.github.com"

# APIドキュメントのリポジトリカテゴリで、オーガニゼーション内のリポジトリを一覧表示するエンドポイント探して下さい
# 組織内のリポジトリを一覧表示するエンドポイントを見つけたら、`org_resource`という変数に
# `programming-for-data-science`というオーガニゼーションのリポジトリを指定するエンドポイントを代入して下さい
org_resource <- "/orgs/programming-for-data-science/repos"

# `base_uri`と`org_resource`を用いてエンドポイントにGETリクエストを送信して下さい
# また、リクエストの結果を`print()`で表示して下さい
response <- GET(paste0(base_uri, org_resource))
print(response)

# `content()`を用いてリクエストのレスポンスを抽出し、`response_text`という変数に代入して下さい
response_text <- content(response, "text")

# `response_text`をデータフレームに変換して下さい
org_repos <- fromJSON(response_text)

# このオーガニゼーションのリポジトリの数を表示して下さい
print(nrow(org_repos))

# `search_endpoint`という変数にリポジトリの検索に使用するエンドポイントを代入して下さい
# ヒント: ドキュメントの"Search"エンドポイントを調べてみると良いでしょう
search_endpoint <- "/search/repositories"

# `query_params`というリスト変数に、適切なキー(key)と値(value)を指定してリポジトリの検索単語を代入して下さい
# この時、検索単語は自由な単語で構いません
query_params <- list(q = "graphics")

# `search_endpoint`と`query_params`を用いてエンドポイントにGETリクエストを送信して下さい
# また、リクエストの結果を`print()`で表示して下さい
response <- GET(paste0(base_uri, search_endpoint), query = query_params)
print(response)

# `content()`を用いてリクエストのレスポンスを抽出し、`response_text`という変数に代入して下さい
response_text <- content(response, "text")

# `response_text`をデータフレームに変換して下さい
graphics_repos = fromJSON(response_text)

# 検索の結果抽出したリポジトリの数を表示して下さい
print(graphics_repos$total_count)

# 検索結果のトップ5のリポジトリを表示して下さい
graphics_repo_names <- graphics_repos$items$full_name[1:5]
print(graphics_repo_names)
