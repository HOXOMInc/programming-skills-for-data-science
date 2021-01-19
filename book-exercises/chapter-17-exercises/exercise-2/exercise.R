# エクササイズ2: このエクササイズでは rbokeh というライブラリを用いてインタラクティブなデータ可視化について学んでいきます

# `dplyr`, `ggplot2`, `rbokeh`パッケージをロードして下さい
library("dplyr")
library("ggplot2")
library("rbokeh")

# RStudioのメニューからワーキングディレクトリを指定して下さい
# Session > Set Working Directory > To Source File Location


# `read.csv()`を用いて、`mortality_rates`という変数に`"data/IHME_WASHINGTON_MORTALITY_RATES_1980_2014.csv`をロードして下さい
mortality_rates <- read.csv(
  file = "data/IHME_WASHINGTON_MORTALITY_RATES_1980_2014.csv",
  stringsAsFactors = FALSE
)

# 今回扱うデータセットは膨大なデータセットですが、今回扱うのはデータセットの一部になります
# そのため、`mortality_rates`データフレームのうち、以下の条件に合致する行と列を抽出し、`plot_data`という変数に代入して下さい
# 分析対象の行
# - `location_name` が "King County" の行
# - `sex` が "Both" でない行
# - `cause_name` が "Neoplasms" の行
# - `year_id` が 2004 以上の行
# 分析対象の列
# - `sex`, `year_id`, `mortality_rate`
plot_data <- mortality_rates %>%
  filter(
    location_name == "King County",
    sex != "Both",
    cause_name == "Neoplasms",
    year_id > 2004
  ) %>%
  select(sex, year_id, mortality_rate)

# `figure()`を用いて`data`には`plot_data`データフレームを、`title`には"Neoplasms Mortality Rate in King County"を指定し、`p`という変数に代入して下さい
p <- figure(
  data = plot_data,                       
  title = "Neoplasms Mortality Rate in King County (2005-2014)"
)

# パイプ(%>%)を用いてレイヤーを追加していきましょう
# `ly_bar()`の引数は以下のように設定して下さい
# - `x`: `yead_id`
# - `y`: `mortality_rate`
# - `color`: `sex`
# - `position`: "dodge"
p <- p %>%
  ly_bar(
    x = as.character(year_id), # column for the x-axis (without quotes!)
    y = mortality_rate,        # column for the y-axis (without quotes!)
    color = sex,               # column for the color encoding (without quotes!)
    position = "dodge"         # dodge, rather than stack, the bars
  )

# 作成したグラフにタイトル、x軸、y軸の説明を追加して下さい
p %>% 
   x_axis(label = "Year") %>% 
   y_axis(label = "Mortality Rate")
