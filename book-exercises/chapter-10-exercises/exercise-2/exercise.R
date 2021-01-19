# エクササイズ２: このエクササイズではR言語でデータフレームの操作方法を学んでいきます

# ("Employee 1", "Employee 2", ... "Employee 100")という要素を持つベクトルを作成して下さい
# ヒント: `paste()`とリサイクルを用いると良いでしょう!
employees <- paste("Employee", 1:100)

# `runif()`を用いて40,000以上、50,000未満の値を１００個要素に持つベクトルを作成して下さい
# この値はEmployee Nの2017年の給与になります
salaries_2017 <- runif(100, 40000, 50000)

# `runif()`を用いて-5,000以上、10,000未満の値を１００個要素に持つベクトルを作成して下さい
# この値は給与の増減額になります
salary_adjustments <- runif(100, -5000, 10000)

# これら3つのベクトルを用いて`salaries`という変数名のデータフレームを作成して下さい
salaries <- data.frame(employees, salaries_2017, salary_adjustments, stringsAsFactors = FALSE)

# `salaries`データフレームに2018年の給与の列を作成して下さい
salaries$salaries_2018 <- salaries$salaries_2017 + salaries$salary_adjustments

# `salaries`データフレームに給与が増加したことを示す列を作成して下さい
salaries$got_raise <- salaries$salaries_2018 > salaries$salaries_2017

### 以降のエクササイズではデータフレームから値を取得していきます
### 値を取得する際には行全体ではなくセルの値を取得するようにして下さい

# Employee 57の2018年の給与を取得して下さい
salary_57 <- salaries[salaries$employees == "Employee 57", "salaries_2018"]

# 給与が上がった従業員(Employee)が何人いるかカウントして下さい
nrow(salaries[salaries$got_raise == TRUE, ])

# 昇給額が最大の値を取得して下さい
highest_raise <- max(salaries$salary_adjustments)

# 昇給額が最大だった従業員(Employee)を取得して下さい
got_biggest_raise <- salaries[salaries$salary_adjustments == highest_raise, "employees"]

# 減給額が最大の値を取得して下さい
biggest_paycut <- min(salaries$salary_adjustments)

# 減給額が最大だった従業員(Employee)が何人いるかをカウントして下さい
got_biggest_paycut <- salaries[salaries$salary_adjustments == biggest_paycut, "employees"]

# 給与の増減額の平均値を取得して下さい
avg_increase <- mean(salaries$salary_adjustments)

# 昇給しなかった従業員(Employee)を対象に、減給額の平均を取得して下さい
avg_loss <- mean(salaries$salary_adjustments[salaries$got_raise == FALSE])

# データフレームを.csvファイルとしてワーキングディレクトリに出力して下さい
write.csv(salaries, "salaries.csv")
