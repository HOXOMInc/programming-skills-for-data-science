# エクササイズ1: このエクササイズではR言語のリストの扱い方を学んでいきます。

# `my_breakfast`という変数に、あなたが食べた朝食のメニューを要素とするベクトルを代入して下さい
my_breakfast <- c("toast", "eggs", "tea")

# `my_lunch`という変数に、あなたが食べた(食べる予定の)昼食のメニューを要素とするベクトルを代入して下さい
my_lunch <- c("soup", "pb + j")

# `meals`という変数に、あなたが食べた朝食と昼食を要素とするリストを代入して下さい
meals <- list(breakfast = my_breakfast, lunch = my_lunch)

# `meals`という変数（リスト）に、あなたが食べた（食べる予定の）夕食のメニューを追加して下さい
meals$dinner <- c("curry", "rice")

# ダラーノテーション($)を用いて`meals`の`dinner`要素を抽出し、`dinner`という変数に代入して下さい
dinner <- meals$dinner

# ダブルブラケット([[]])を用いて`meals`の`lunch`要素を抽出し、`meals`の５番目の要素に代入して下さい
meals[[5]] <- meals[["lunch"]]

# シングルブラケット([])を用いて`meals`の`breakfast`と`lunch`要素を抽出し、`early_meals`という変数に代入して下さい
early_meals <- meals[1:2]

### Challenge ###

# `meals`変数を対象に、各食事で何品食べたかを計算して下さい
# ヒント: length()とlaaply()を用いてみましょう！
items <- lapply(meals, length)

# add_pizza()という関数を定義して下さい
# この関数はmealという変数名のベクトルの末尾の要素にpizzaを追加し、返り値とします
add_pizza <- function(meal) {
  meal <- c(meal, "pizza")
  meal # 返り値
}

# `better_meals`という変数の各要素にpizzaを追加して下さい！
better_meals <- lapply(meals, add_pizza)
