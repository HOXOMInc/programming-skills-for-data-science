# 必要なライブラリをロードします
library("httr")
library("jsonlite")

# `README.md`を必ず確認してからこのエクササイズを実施して下さい！


# `source()`を用いて`apikey.R`からAPIキーをロードして下さい


# `movie_name`という変数にあなたの好きな映画のタイトルを代入して下さい


# `movie_name`で指定した映画のレビューを検索するHTTPリクエストを作成して下さい
# ベースURI: `https://api.nytimes.com/svc/movies/v2/`
# リソース: reviews/search.json`
# パラメータの詳細: https://developer.nytimes.com/movie_reviews_v2.json


# HTTPリクエストを送信してデータをダウンロードして下さい
# 続いて、`content()`を用いて結果を抽出し、`fromJSON()`を用いて変換して下さい


# `fromJSON()`で変換した結果がどんなデータ型になるか確認して下さい
# データフレームでしょうか。それともリストでしょうか。


# データの中を確認し、どの項目が映画のレビューかを確認して下さい
# この時、`names()`や`str()`といった関数を用いると良いでしょう


# 映画のレビューを`flatten()`を用いて変換し、`reviews`という変数に代入して下さい


# 直近のレビューを抽出し、ヘッドラインと要約、記事それぞれを`headline`,`summary`,`link`という変数に代入して下さい


# `review`というリスト変数に`headline`,`summary`,`link`の値を代入し、`print()`で`review`を表示して下さい

