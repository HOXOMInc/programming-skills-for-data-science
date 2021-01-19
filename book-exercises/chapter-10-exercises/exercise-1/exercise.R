# エクササイズ1: このエクササイズではR言語でデータフレームを作成する方法を学んでいきます。

# シアトル・シーホークスが今シーズン最初の４ゲームでの`得点`を要素とするベクトルを作成して下さい
points <- c(12, 3, 37, 27) # 2016シーズン

# シアトル・シーホークスが今シーズン最初の４ゲームでの`失点`を要素とするベクトルを作成して下さい
points_allowed <- c(10, 9, 18, 17)

# これら2つのベクトルを使って`games`という変数名のデータフレームを作成して下さい
games <- data.frame(points, points_allowed)

# `games`データフレームに得点差を表す列を追加して下さい
games$diff <- games$points - games$points_allowed

# `games`データフレームに勝敗を表す列を追加して下さい
games$won <- games$diff > 0

# シアトル・シーホークスが今シーズン最初の４ゲームでの`対戦相手`を要素とするベクトルを作成して下さい
opponents <- c("Dolphins", "Rams", "49ers", "Jets")

# データフレームの行名に`対戦相手`を設定して下さい
rownames(games) <- opponents

# View()を用いて作成したデータフレームを表示して下さい
View(games)
