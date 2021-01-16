# dplyr in Action: フライトデータの分析

# `nycflights13`パッケージをロードして、`flights`データを取得する
install.packages("nycflights13") # `nycflights13`パッケージをインストールする
library("nycflights13")          # `nycflights13`パッケージをロードする
library("dplyr")                 # `dplyr`パッケージをロードする
library("ggplot2")               # `ggplot2`パッケージをロードする

# データセットに関する理解を深める
?flights          # データセットのドキュメントを確認する
dim(flights)      # データセットの行/列数を確認する
colnames(flights) # 列名を確認する
View(flights)     # データフレームをRStudio Viewerで確認する

# 最も多い回数の出発遅延が起きている航空会社(`carrier`)を特定する
has_most_delays <- flights %>%            # flightsデータフレームを指定する
  group_by(carrier) %>%                   # 航空会社(`carrier`)でgroup byする
  filter(dep_delay > 0) %>%               # 遅延の起きている行を抽出する
  summarize(num_delay = n()) %>%          # 行数をカウントする
  filter(num_delay == max(num_delay)) %>% # 最も多い回数の出発遅延を特定する
  select(carrier)                         # 航空会社(`carrier`)を選択する

# 最も多い回数の出発遅延が起きている航空会社(`carrier`)の名前を取得する
most_delayed_name <- has_most_delays %>%  # has_most_delaysを指定する
  left_join(airlines, by = "carrier") %>% # 航空会社IDを用いて航空会社の名前を結合する
  select(name)                            # 航空会社の名前を選択する

print(most_delayed_name$name) # 航空会社の名前を表示する

# 目的空港(`dest`)別に、遅延(`arr_delay`)の平均を算出する
most_early <- flights %>%
  group_by(dest) %>% # 目的空港(`dest`)でgroup byする
  summarize(delay = mean(arr_delay)) # 遅延(`arr_delay`)の平均を算出する

# 欠損(NA)のある行を除いて、目的空港(`dest`)別に、遅延(`arr_delay`)の平均を算出する
most_early <- flights %>%
  group_by(dest) %>% # 目的空港(`dest`)でgroup byする
  summarize(delay = mean(arr_delay, na.rm = TRUE)) # 欠損(NA)のある行を除いて遅延(`arr_delay`)の平均を算出する

# 到着予定時刻より最も早く到着している空港を特定する
most_early <- flights %>%
  group_by(dest) %>% # 目的空港(`dest`)でgroup byする
  summarize(delay = mean(arr_delay, na.rm = TRUE)) %>% # 欠損(NA)のある行を除いて遅延(`arr_delay`)の平均を算出する
  filter(delay == min(delay, na.rm = TRUE)) %>% # 最も遅れていない(最も早く到着している)行を抽出する
  select(dest, delay) %>% # 目的空港(`dest`)と遅延(`delay`)を選択する
  left_join(airports, by = c("dest" = "faa")) %>% # `dest`と`faa`をキーとして空港名を結合する
  select(dest, name, delay) # 対象の列を選択する

print(most_early)

# 最も長い到着の遅延が発生している月を特定する
flights %>%
  group_by(month) %>% # 月(`month`)でgroup byする
  summarize(delay = mean(arr_delay, na.rm = TRUE)) %>% # 欠損(NA)のある行を除いて遅延(`arr_delay`)の平均を算出する
  filter(delay == max(delay)) %>% # 最も遅い到着の発生している行を抽出する
  select(month) %>% # 対象の列を選択する
  print() # 結果を出力する

# 月別の到着の遅延を算出する
# この時、R言語に搭載されている`month.name`という変数を用いて月名を付与する
delay_by_month <- flights %>%
  group_by(month) %>%
  summarize(delay = mean(arr_delay, na.rm = TRUE)) %>%
  select(delay) %>%
  mutate(month = month.name)

# 第17章で説明する`ggplot2`パッケージを用いてグラフを描画する
ggplot(data = delay_by_month) +
  geom_point(
    mapping = aes(x = delay, y = month), 
    color = "blue",
    alpha = .4, 
    size = 3
  ) +
  geom_vline(xintercept = 0, size = .25) +
  xlim(c(-20, 20)) +
  scale_y_discrete(limits = rev(month.name)) +
  labs(title = "Average Delay by Month", y = "", x = "Delay (minutes)")
  
