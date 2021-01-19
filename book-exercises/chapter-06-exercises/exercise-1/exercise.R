# エクササイズ1: このエクササイズではR言語のデフォルトで搭載されている関数の呼び方を学んでいきます。

# my_nameという変数にあなたの名前を代入して下さい
my_name <- "Joel Ross"

# nchar()を用いてname_lengthという変数にあなたの名前の文字数（スペースを含みます）を入力して下さい
name_length <- nchar(my_name)

# print()を用いてあなたの名前の文字数を出力して下さい
print(name_length)

# now_doingという変数に、あなたの名前の後ろに"is programming!"という文字列を付与して下さい
now_doing <- paste(my_name, "is programming!")

# now_doingという変数を大文字にしてください
toupper(now_doing)

### ボーナス問題

# 1から100までの整数の中からあなたの好きな数を2つ選んでfav_1, fav_2という変数に代入して下さい
fav_1 <- 12
fav_2 <- 87

# fav_1, fav_2をそれぞれ201の平方根で割って、fav_1, fav_2の値を更新して下さい
fav_1 <- fav_1 / sqrt(201)
fav_2 <- fav_2 / sqrt(201)

# sum()を用いてfav_1とfav_2の合計値を算出し、raw_sumという変数に代入して下さい
raw_sum <- sum(fav_1, fav_2)

# round()を用いてraw_sumを小数点第一位で四捨五入し、round_sumという変数に代入して下さい
round_sum <- round(raw_sum, 1)

# fav_1とfav_2を小数点第一位で四捨五入し、round_1, round_2という変数に代入して下さい
round_1 <- round(fav_1, 1)
round_2 <- round(fav_2, 1)

# sum_roundという変数に、round_1とround_2の合計値を代入して下さい
sum_round <- sum(round_1, round_2)

# max()を用いてround_sumとsum_roundのどちらが大きいか判定して下さい
max(sum_round, round_sum)
