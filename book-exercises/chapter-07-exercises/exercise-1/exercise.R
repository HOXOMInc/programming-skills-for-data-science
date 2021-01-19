# エクササイズ1: このエクササイズではR言語でベクトルを作成、操作する方法を学んでいきます。

# `names`という変数名であなたと他2名の名前を要素としたベクトルを作成し、print()でベクトルを表示して下さい
names <- c("Joel", "Mike", "Dave")
print(names)

# `n`という変数名で、コロン(:)オペレータを用いて１０から４９までの整数を要素とするベクトルを作成して下さい
n <- 10:49

# length()を用いて`n`の要素数を計算して下さい
length(n)

# `n`の全ての要素に1を足して結果を出力して下さい
print(n + 1)

# `m`という変数名で、seq()を用いて10から1までの整数を要素とするベクトルを作成して下さい
m <- seq(10, 1)

# リサイクルを用いて`m`から`n`を引いて下さい
n_less_m <- n - m
print(n_less_m)

# `x_range`という変数名で、seq()を用いて-5から10まで0.1刻みの数値を要素とするベクトルを作成して下さい
x_range <- seq(-5, 10, 0.1)

# `x_range`をsin()の引数としてベクトルを作成し、`sin_wave`という変数に代入して下さい
sin_wave <- sin(x_range)

# `x_range`をcos()の引数としてベクトルを作成し、`cos_wave`とい
cos_wave <- cos(x_range)

# `wave`という変数名で、`sin_wave`と`sin_wave`を掛けた結果を要素とするベクトルを作成して下さい
wave <- sin_wave * cos_wave + sin_wave

# plot()を用いて`wave`を描画して下さい！
plot(wave)
