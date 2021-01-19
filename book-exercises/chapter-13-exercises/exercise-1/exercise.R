# エクササイズ1: このエクササイズではR言語を用いてSQLiteデータベースにアクセスする方法を学んでいきます。

# 分析に必要な`dplyr`,`DBI`,`RSQLite`パッケージをインストールしロードして下さい
library("dplyr")
library("DBI")
library("RSQLite")

# `data`フォルダに格納されている`Chinook_Sqlite.sqlite`に接続して下さい
db_connection <- dbConnect(SQLite(), dbname = "data/Chinook_Sqlite.sqlite")

# `dbListTables()`を用いてデータベースに存在するテーブルのリストを取得して下さい
dbListTables(db_connection)

# `tbl()`を用いて`Genre`テーブルを参照して下さい
genre_tbl <- tbl(db_connection, "Genre")

# `View()`を用いてテーブルの中身を表示して下さい
# 何が起きるでしょうか？
View(genre_tbl)

# `collect()`を用いて`Genre`テーブルをメモリにデータフレームとしてロードして下さい
# また、ロードしたデータフレームを`View()`を用いて確認して下さい
genre_df <- collect(genre_tbl)
View(genre_df)

# dplyrの`count()`を用いてデータフレームが何行あるか確認して下さい
genre_tbl %>% count()

# `tbl()`を用いて`Track`テーブルを参照して下さい
track_tbl <- tbl(db_connection, "Track")
print(track_tbl)

# dplyrの関数を用いて、アーティスト(Composer)を人気順に並べ替えて下さい
# この処理は以下の手順で実施して下さい
# また、これらの処理はパイプオペレータ(%>%)を用いて実施して下さい
# 1. `filter()`を用いてアーティストの値が欠損していない行を抽出して下さい
# 2. `group_by()`を用いてアーティストでグルーピング処理して下さい
# 3. `count()`を用いて行をカウントして下さい
# 4. `arrange()`を用いて人気順に並べ替えて下さい
popular_artists <- track_tbl %>%
  filter(is.na(Composer) == FALSE) %>%
  group_by(Composer) %>%
  count() %>%
  arrange(-n)
print(popular_artists)

# dplyrの関数を用いて、最も人気のあるジャンルを特定して下さい
# この処理は以下の手順で実施して下さい
# また、これらの処理はパイプオペレータ(%>%)を用いて実施して下さい
# 1. `group_by()`を用いてジャンルでグルーピング処理して下さい
# 2. `count()`を用いて行をカウントして下さい
# 3. `Genre`テーブルを結合してジャンル名(Name)を列として追加して下さい
# 4. `arrange()`を用いて人気順に並べ替えて下さい
# 5. `collect()`を用いてデータフレームとして抽出して下さい
# 6. `print()`を用いて最も人気のあるジャンル名(Name)を表示して下さい
genre_count_names_df <- genre_counts %>%
  group_by(GenreId) %>%
  count() %>%
  left_join(genre_tbl) %>%
  arrange(-count) %>%
  collect()

print(genre_count_names_df[1, "Name"])

# ボーナスエクササイズ
# 各ジャンルにおける最も人気のアーティスト(Composer)を特定して下さい
# ヒント: `max()`と`filter()`を組み合わせて最も人気のあるアーティスト(Composer)の行を抽出しても良いでしょう！
track_tbl %>%
  filter(is.na(Composer) == FALSE) %>%
  group_by(GenreId, Composer) %>%
  count() %>%
  left_join(genre_tbl) %>%
  select(Genre = Name, Composer, count = n) %>%
  collect() %>%
  group_by(Genre) %>%
  filter(count == max(count)) %>%
  arrange(-count)

# データ分析が完了したのでデータベースとの接続を解除して下さい！
dbDisconnect(db_connection)
