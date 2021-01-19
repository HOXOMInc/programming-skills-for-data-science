# Exercise 4: このエクササイズではR言語で2008年から2010年の間にゲイツ財団によって授与された教育助成金のデータセットを操作していきます

# `grants`という変数に`read.csv()`を用いて`data/gates_money.csv`を代入して下さい
grants <- read.csv("data/gates_money.csv", stringsAsFactors = FALSE)

# `View()`を用いて`grants`を表示して下さい
View(grants)

# `organization`という変数に`organization`列の値を代入して下さい
organization <- grants$organization

# `is.vector()`を用いて`organization`という変数がベクトルであるかどうかを確認して下さい
is.vector(organization)

# 助成金(`total_amount`)の平均を算出して下さい
mean_spending <- mean(grants$total_amount)

# 助成金(`total_amount`)の最大を算出して下さい
highest_amount <- max(grants$total_amount)

# 助成金(`total_amount`)の最小を算出して下さい
lowest_amount <- min(grants$total_amount)

# どの団体(organization)が最も高い助成金をもらっているかを算出して下さい
largest_recipient <- organization[grants$total_amount == highest_amount]

# どの団体(organization)が最も低い助成金をもらっているかを算出して下さい
smallest_recipient <- organization[grants$total_amount == lowest_amount]

# 2010年にいくつの助成金が授与されたか算出して下さい
length(grants$total_amount[grants$start_year == 2010])
