# `tidyr` in action: 教育統計データの可視化

# 必要なライブラリをロードする
library(tidyr) # データラングリングのためのライブラリ
library(dplyr) # データラングリングのためのライブラリ
library(ggplot2) # データ可視化のためのライブラリ
library(ggrepel) # データ可視化のためのライブラリ
library(scales) # データ可視化のためのライブラリ

# 先頭4行を無視して.csvファイルをロードする
wb_data <- read.csv(
  "data/world_bank_data.csv",
  stringsAsFactors = F,
  skip = 4
)

# 各国の教育支出を1990年と2014年で比較する
# 興味の対象である指標("Government expenditure on education, total (% of GDP)")の行を抽出する
indicator <- "Government expenditure on education, total (% of GDP)"
expenditure_plot_data <- wb_data %>%
  filter(Indicator.Name == indicator)

# `ggplot2`パッケージを用いて各国の教育支出を1990年と2014年で比較する
# 詳細は第１６章を参照して下さい
expenditure_chart <- ggplot(data = expenditure_plot_data) +
  geom_text_repel(
    mapping = aes(x = X1990 / 100, y = X2014 / 100, label = Country.Code)
  ) +
  scale_x_continuous(labels = percent) +
  scale_y_continuous(labels = percent) +
  labs(
    title = indicator, x = "Expenditure 1990",
    y = "Expenditure 2014"
  )

# データを整形して`year`という列を作成する
long_year_data <- wb_data %>%
  gather(
    key = year, # `year`をキーの列として作成する
    value = value, # `value`列に値を代入する
    X1960:X # `X1960`から`X`の列を集約する
  )

# 興味の対象である指標と国を指定してフィルタリングする
indicator <- "Government expenditure on education, total (% of GDP)"
spain_plot_data <- long_year_data %>%
  filter(
    Indicator.Name == indicator,
    Country.Code == "ESP" # スペイン
  ) %>%
  mutate(year = as.numeric(substr(year, 2, 5))) # `year`列の先頭文字のXを削除する

# スペインにおける教育支出の推移を可視化する
chart_title <- paste(indicator, " in Spain")
spain_chart <- ggplot(data = spain_plot_data) +
  geom_line(mapping = aes(x = year, y = value / 100)) +
  scale_y_continuous(labels = percent) +
  labs(title = chart_title, x = "Year", y = "Percent of GDP Expenditure")

# データを整形し可視化に必要な列を作成する
wide_data <- long_year_data %>%
  select(-Indicator.Code) %>% # `Indicator.Code`列を除外する
  spread(
    key = Indicator.Name, # `Indicator.Name`の値を新しい列として作成する
    value = value # `value`列の値を新たな列に代入する
  )

# 興味の対象となる指標を算出して列を作成し、対象の年を抽出する
x_var <- "Literacy rate, adult female (% of females ages 15 and above)"
y_var <- "Unemployment, female (% of female labor force) (modeled ILO estimate)"
lit_plot_data <- wide_data %>%
  mutate(
    lit_percent_2014 = wide_data[, x_var] / 100,
    employ_percent_2014 = wide_data[, y_var] / 100
  ) %>%
  filter(year == "X2014")

# 各国における女性の識字率と失業率の関係を可視化する
lit_chart <- ggplot(data = lit_plot_data) +
  geom_point(mapping = aes(x = lit_percent_2014, y = employ_percent_2014)) +
  scale_x_continuous(labels = percent) +
  scale_y_continuous(labels = percent) +
  labs(
    x = x_var,
    y = "Unemployment, female (% of female labor force)",
    title = "Female Literacy Rate versus Female Unemployment Rate"
  )
