# エクササイズ1: このエクササイズではR言語でのデータフレームの操作方法を復習します

# "devtools"パッケージをインストールする
install.packages("devtools")

# GitHubから"fueleconomy"データセットをインストールする
devtools::install_github("hadley/fueleconomy")

# "fueleconomy"パッケージをロードする
library(fueleconomy)

# View()を用いてvehiclesデータセットの中身を確認して下さい


# 車のメーカ(make)の列を抽出してベクトルとして変数に代入して下さい


# `unique()`を用いて車のメーカのユニークな値を抽出して下さい


# 1997年に製造された車種を抽出して下さい


# 高速道路の燃費(`hwy`)順に1997年に製造された車をソートして下さい
# ヒント: `order()`を使いましょう！
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/


# 1997年に製造された車を対象に、平均燃費を算出して下さい
# 平均燃費の算出には高速道路の燃費（`hwy`）と市街地での燃費(`cty`)の平均を用いて下さい


# 燃費が"20 miles/gallon"以上の二輪自動車を抽出して変数に代入して下さい


# この変数の中から最も燃費(`hwy`)が悪い二輪自動車を抽出して下さい


# `make_year_filter()`という関数を定義して下さい
# この関数の引数は年(`year_choice`)とメーカ（`make_choice`）であって、最も燃費(`hwy`)が良い車種を返り値とします


# 1995年にHondaで最も燃費の良い車種を抽出して下さい

