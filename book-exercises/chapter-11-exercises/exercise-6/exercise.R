# エクササイズ6: このエクササイズではR言語のパッケージであるdplyrを用いて、nycflights13パッケージのデータを対象にデータフレームの結合処理の方法を学んでいきます

# `nycflights13`パッケージと`dplyr`パッケージをインストール、ロードして下さい
#install.packages("nycflights13")
library("nycflights13")
library("dplyr")

# 到着空港別に出発遅延の平均値を算出し、`left_join()`を用いて`airports`データフレームを結合して下さい
# その後、出発遅延の平均が最も大きい空港名を抽出して下さい
largest_arrival_delay <- flights %>%
  group_by(dest) %>%
  summarise(avg_delay = mean(arr_delay, na.rm = TRUE)) %>%
  mutate(faa = dest) %>%
  left_join(airports, by = "faa") %>%
  filter(avg_delay == max(avg_delay, na.rm = TRUE))
largest_arrival_delay

# 航空会社別に出発遅延の平均値を算出し、`left_join()`を用いて`airlines`データフレームを結合して下さい
# その後、出発遅延の平均が最も小さい航空会社を抽出して下さい
smallest_airline_delay <- flights %>%
  group_by(carrier) %>%
  summarise(avg_delay = mean(arr_delay, na.rm = TRUE)) %>%
  left_join(airlines, by = "carrier") %>%
  filter(avg_delay == max(avg_delay, na.rm = TRUE))
smallest_airline_delay
