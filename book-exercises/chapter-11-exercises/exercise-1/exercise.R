# エクササイズ1: このエクササイズではR言語でのデータフレームの操作方法を復習します

# "devtools"パッケージをインストールする
install.packages("devtools")

# GitHubから"fueleconomy"データセットをインストールする
devtools::install_github("hadley/fueleconomy")

# "fueleconomy"パッケージをロードする
library(fueleconomy)

# View()を用いてvehiclesデータセットの中身を確認して下さい
View(vehicles)

# 車のメーカ(make)の列を抽出してベクトルとして変数に代入して下さい
makes <- vehicles$make

# `unique()`を用いて車のメーカのユニークな値を抽出して下さい
length(unique(makes))

# 1997年に製造された車種を抽出して下さい
cars_1997 <- vehicles[vehicles$year == 1997, ]

# 高速道路の燃費(`hwy`)順に1997年に製造された車をソートして下さい
# ヒント: `order()`を使いましょう！
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/
cars_1997 <- cars_1997[order(cars_1997$hwy), ]

# 1997年に製造された車を対象に、平均燃費を算出して下さい
# 平均燃費の算出には高速道路の燃費（`hwy`）と市街地での燃費(`cty`)の平均を用いて下さい
cars_1997$average <- (cars_1997$hwy + cars_1997$cty) / 2

# 燃費が"20 miles/gallon"以上の二輪自動車を抽出して変数に代入して下さい
two_wheel_20_mpg <- vehicles[vehicles$drive == "2-Wheel Drive" & vehicles$cty > 20, ]

# この変数の中から最も燃費(`hwy`)が悪い二輪自動車を抽出して下さい
worst_hwy <- two_wheel_20_mpg$id[two_wheel_20_mpg$hwy == min(two_wheel_20_mpg$hwy)]

# `make_year_filter()`という関数を定義して下さい
# この関数の引数は年(`year_choice`)とメーカ（`make_choice`）であって、最も燃費(`hwy`)が良い車種を返り値とします
make_year_filter <- function(make_choice, year_choice) {
  filtered <- vehicles[vehicles$make == make_choice & vehicles$year == year_choice, ]
  filtered[filtered$hwy == max(filtered$hwy), "model"]
}

# 1995年にHondaで最も燃費の良い車種を抽出して下さい
make_year_filter("Honda", 1995)
