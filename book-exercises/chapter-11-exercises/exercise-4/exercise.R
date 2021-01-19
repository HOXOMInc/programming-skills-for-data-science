# エクササイズ4: このエクササイズではR言語のパッケージであるdplyrを用いて、2013年にニューヨークを出発するフライトのデータであるnycflights13パッケージのデータを処理していきます

# `nycflights13`パッケージと`dplyr`パッケージをインストール、ロードして下さい
install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# View()を用いて`flights`データフレームを確認して下さい
View(flights)

# `flights`データフレームの列名を確認して下さい
colnames(flights)

# `flights`データフレームの行数と列数を確認して下さい
nrow(flights)
ncol(flights)

# `??flights`を用いてデータセットのドキュメントを確認して下さい
?flights

# `dplyr`の関数を用いて`arr_delay - dep_delay`の値を格納する列(`gain_in_air`)を新しく作成して下さい
flights <- mutate(flights, gain_in_air = arr_delay - dep_delay)

# `dplyr`の関数を用いて作成した列を対象に降順でソートして下さい
flights <- arrange(flights, desc(gain_in_air))

# 前述の2つの処理をパイプオペレータ(%>%)を用いて記述して下さい
flights <- flights %>% mutate(gain_in_air = arr_delay - dep_delay) %>% arrange(desc(gain_in_air))

# `hist()`を用いて`gain_in_air`のヒストグラムを算出して下さい
hist(flights$gain_in_air)

# `gain_in_air`の平均を算出して下さい
# 注意点: `na.rm = TRUE`オプションを設定して欠損(NA)のある行を除外して下さい
mean(flights$gain_in_air, na.rm = TRUE)

# `flights`データフレームから、`origin`, `destination`, `gain_in_air`列を抽出して下さい
# 続いて、到着空港(`dest`)が'SEA'の行を抽出して下さい
to_sea <- flights %>% select(origin, dest, gain_in_air) %>% filter(dest == "SEA")

# 抽出したデータフレームを対象に、`gain_in_air`の平均を算出して下さい
# 注意点: `na.rm = TRUE`オプションを設定して欠損(NA)のある行を除外して下さい
mean(to_sea$gain_in_air, na.rm = TRUE)

# 出発空港が'JFK'、到着空港が'SEA'の行を対象に、air_timeの平均、最小、最大を算出して下さい
# この時、パイプオペレータ(%>%)を用いて下さい
filter(flights, origin == "JFK", dest == "SEA") %>%
  summarize(
    avg_air_time = mean(air_time, na.rm = TRUE),
    max_air_time = max(air_time, na.rm = TRUE),
    min_air_time = min(air_time, na.rm = TRUE)
  )
