# エクササイズ5: このエクササイズではR言語のパッケージであるdplyrを用いて、nycflights13パッケージのデータを対象にグルーピング処理の方法を勉強していきます

# `nycflights13`パッケージと`dplyr`パッケージをインストール、ロードして下さい
#install.packages("nycflights13")
library("nycflights13")
library("dplyr")

# `dep_delay_by_month`という変数に、月別の出発遅延の平均値を代入して下さい
# ヒント: まずはgroup_by()を用いて月でグルーピング処理し、summarize()で平均値を算出しましょう！
dep_delay_by_month <- flights %>%
  group_by(month) %>%
  summarize(delay = mean(dep_delay, na.rm = TRUE))
dep_delay_by_month

# どの月が最も出発遅延が大きいか確認して下さい
filter(dep_delay_by_month, delay == max(delay)) %>% select(month)

# もし`dep_delay_by_month`データフレームの列が"month"と"delay"だけであれば、`plot()`を用いて散布図を描画して下さい
plot(dep_delay_by_month)

# どの到着空港が最も出発遅延が大きいか確認して下さい
# ヒント: まずはgroup_by()を用いて月でグルーピング処理し、summarize()で平均値を算出しましょう！
# また、この時`head()`を用いて先頭行を確認して下さい
arr_delay_by_month <- flights %>%
  group_by(dest) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(-delay)
head(arr_delay_by_month)

# 最も出発遅延が大きい空港名を、`airports`データフレームから抽出して下さい
filter(airports, faa == arr_delay_by_month$dest[1])

# 最も平均の飛行速度が早い到着空港(`dest`)を抽出して下さい
city_fasted_speed <- flights %>%
  mutate(speed = distance / air_time * 60) %>%
  group_by(dest) %>%
  summarise(avg_speed = mean(speed, na.rm = TRUE)) %>%
  filter(avg_speed == max(avg_speed, na.rm = TRUE))
city_fasted_speed
