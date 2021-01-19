# エクササイズ2: このエクササイズではR言語のベクトルのインデックスとフィルタリングの使い方を学んでいきます

# `first_ten`という変数に、コロン(:)オペレータを用いて10から20の整数を要素とするベクトルを代入して下さい
first_ten <- 10:20

# `next_ten`という変数に、seq()を用いて21から30の整数を要素とするベクトルを代入して下さい
next_ten <- seq(21, 30)

# `first_ten`と`first_ten`を結合して`all_numbers`というベクトルを作成して下さい
all_numbers <- c(first_ten, next_ten)

# `eleventh`という変数に、`all_numbers`の１１番目の要素を代入して下さい
eleventh <- all_numbers[11]

# `some_numbers`という変数に、`all_numbers`の2番目から５番目の要素を代入して下さい
some_numbers <- all_numbers[2:5]

# `even`という変数に、1から１００までの数のうち偶数を要素とするベクトルを代入して下さい
even <- seq(2, 100, 2)

# all()とモジュロ(%%)オペレータを用いて、`even`の要素が全て偶数であることを確認して下さい
test <- all(even %% 2 == 0)

# `phone_numbers`という変数に、8, 6, 7, 5, 3, 0, 9を要素とするベクトルを代入して下さい
phone_numbers <- c(8, 6, 7, 5, 3, 0, 9)

# `prefix`という変数に、`phone_numbers`の1番目から3番目の要素を代入して下さい
prefix <- phone_numbers[1:3]

# `small`という変数に、`phone_numbers`の要素で5以下の数値を要素とするベクトルを代入して下さい
small <- phone_numbers[phone_numbers <= 5]

# `large`という変数に、`phone_numbers`の要素で5より大きい数値を要素とするベクトルを代入して下さい
large <- phone_numbers[phone_numbers > 5]

# `phone_numbers`の要素で5より大きい数値を5に置換して下さい
phone_numbers[phone_numbers > 5] <- 5

# `phone_numbers`の要素で奇数の要素を0に置換して下さい
phone_numbers[phone_numbers %% 2 == 1] <- 0
