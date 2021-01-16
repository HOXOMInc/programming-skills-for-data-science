# 必要なライブラリをロードします
library(dplyr)
library(shiny)
library(plotly)

# データを読み込みます
source('./scripts/build_map.R')
df <- read.csv('./data/electoral_college.csv', stringsAsFactors = FALSE)
state_codes <- read.csv('./data/state_codes.csv', stringsAsFactors = FALSE)

# `df`と`state_codes`を結合します
joined_data <- left_join(df, state_codes, by="state")

# 各州の10万人あたりの選挙人投票数を計算します
joined_data <- joined_data %>% mutate(ratio = votes/population * 100000)

# サーバ関数を定義して下さい
  
  # `renderPlotly()`を用いて地図を描画して下さい
  
