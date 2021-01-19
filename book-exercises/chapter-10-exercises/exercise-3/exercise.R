# エクササイズ3: このエクササイズではR言語であらかじめ提供されているデータを用いてデータフレームの操作方法を学んでいきます

# R言語であらかじめ提供されている "USPersonalExpenditure" データセットを`data()`を用いてロードして下さい
# データセットをロードすると `USPersonalExpenditure` という変数名の変数が作成されます
data("USPersonalExpenditure")

# `is.data.frame()`を用いて`USPersonalExpenditure`がデータフレームであるかどうかを確認して下さい
is.data.frame(USPersonalExpenditure)

# `data.frame()`を用いて`USPersonalExpenditure`をデータフレームに変換して下さい
us_exp <- data.frame(USPersonalExpenditure)

# データフレームの列名を表示して下さい
colnames(us_exp)

# データフレームの行名を表示して下さい
rownames(us_exp)

# 行名を値とする列を追加して下さい
us_exp$category <- rownames(us_exp)

# 1940年に"Personal Care"にいくらのお金が費やされたか算出して下さい
care_1940 <- us_exp["Personal Care", "X1940"]

# 1960年に"Food and Tobacco"にいくらのお金が費やされたか算出して下さい
food_1960 <- us_exp["Food and Tobacco", "X1960"]

# 1960年に最もお金が費やされたカテゴリを特定して下さい
highest_1960 <- us_exp$category[us_exp$X1960 == max(us_exp$X1960)]

# lowest_category()という関数を定義して下さい
# この関数は年(year)を引数とし、その年に最もお金が費やされていないカテゴリを返り値とします
lowest_category <- function(year) {
  col <- paste0("X", year)
  us_exp$category[us_exp[, col] == min(us_exp[, col])]
}

# lowest_category()を用いて、各年の最もお金が費やされていないカテゴリを特定して下さい
# ヒント: `sapply()`を使うと良いでしょう！
lowest <- sapply(seq(1940, 1960, 5), lowest_category)
