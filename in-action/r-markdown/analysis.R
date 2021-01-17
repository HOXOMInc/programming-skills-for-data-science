# R Markdown in Action: 寿命に関するレポート

# 必要なパッケージをロードする
library(dplyr)
library(rworldmap) # 地図描画のため
library(RColorBrewer) # カラーパレットを選択するため

# 不要な先頭4行をスキップして.csvデータをロードする
life_exp <- read.csv(
  "data/API_SP.DYN.LE00.IN_DS2_en_csv_v2.csv",
  skip = 4,
  stringsAsFactors = FALSE
)

# 注意点
# Rのデータフレームでは列名の先頭に数字を代入することが出来ない
# そのため年(`year`)の列名の先頭に "X" が付与される

# 2015年に最も寿命が長い国がどこだったかを抽出する
longest_le <- life_exp %>%
  filter(X2015 == max(X2015, na.rm = T)) %>%
  select(Country.Name, X2015) %>%
  mutate(expectancy = round(X2015, 1)) # 列の名前を変更してフォーマットする

# 2015年に最も寿命が短い国がどこだったかを抽出する
  filter(X2015 == min(X2015, na.rm = T)) %>%
  select(Country.Name, X2015) %>%
  mutate(expectancy = round(X2015, 1)) # 列の名前を変更してフォーマットする

# 寿命の範囲を算出する
le_difference <- longest_le$expectancy - shortest_le$expectancy

# 寿命が伸びたTOP１０の国はどこか抽出する
top_10_gain <- life_exp %>%
  mutate(gain = X2015 - X1960) %>%
  top_n(10, wt = gain) %>%
  arrange(-gain) %>%
  mutate(gain_formatted = paste(format(round(gain, 1), nsmall = 1), "years")) %>%
  select(Country.Name, gain_formatted)

# life_expデータにshapefileを結合する
# この関数は`rworldmap`パッケージで提供されている
mapped_data <- joinCountryData2Map(
  life_exp,
  joinCode = "ISO3",
  nameJoinColumn = "Country.Code",
  mapResolution = "high"
)
