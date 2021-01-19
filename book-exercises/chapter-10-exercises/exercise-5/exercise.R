# エクササイズ5: このエクササイズではR言語で1961年から2013年までの米国において人気の女性の名前に関するデータセットを操作していきます

# `names`という変数に`read.csv()`を用いて`female_names.csv`を代入して下さい
names <- read.csv("data/female_names.csv", stringsAsFactors = FALSE)

# `names_2013`という変数に`names`の2013年の行を代入して下さい
names_2013 <- names[names$year == 2013, ]

# 2013年に最も人気のあった女性の名前を抽出して下さい
most_popular_name_2013 <- names_2013[names_2013$prop == max(names_2013$prop), "name"]

# `most_popular_in_year()`という関数を定義して下さい
# この関数は、年(year)を引数とし、最も人気のあった女性の名前を返り値とします
most_popular_in_year <- function(year) {
  names_year <- names[names$year == year, ]
  most_popular <- names_year[names_year$prop == max(names_year$prop), "name"]
  most_popular # return most popular
}

# `most_popular_in_year()`を用いて1994年に最も人気のあった女性の名前を抽出して下さい
most_popular_1994 <- most_popular_in_year(1994)

# `number_in_million()`という関数を定義して下さい
# この関数は、名前(name)と年(year)を引数とし、１００万人中何人その名前の赤ちゃんがいたのかを返り値とします
number_in_million <- function(name, year) {
  name_popularity <- names[names$year == year & names$name == name, "prop"]
  round(name_popularity * 1000000, 1)
}

# 1995年に'Laura'という名前の赤ちゃんが１００万人中何人いたかを算出して下さい
number_in_million("Laura", 1995)
