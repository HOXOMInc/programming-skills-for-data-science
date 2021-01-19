# エクササイズ3: このエクササイズではR言語のパッケージであるdplyrのパイプオペレータの使い方を学んでいきます。

# `dplyr`パッケージをインストールしてロードする
#install.packages("dplyr")
library("dplyr")

# `fueleconomy`パッケージをインストールしてロードする
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library("fueleconomy")

# 一時変数を用いて、2015年のHondaのAcuraを対象に、最も良い高速道路のMPG(Miles per galon)のモデルを抽出して下さい
acuras <- filter(vehicles, make == "Acura", year == 2015)
best_acura <- filter(acuras, hwy == max(hwy))
best_model <- select(best_acura, model)

# `dplyr`とネスト関数を用いて、2015年のHondaのAcuraを対象に、最も良い高速道路のMPG(Miles per galon)のモデルを抽出して下さい
best_model <- select(
  filter(
    filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy)
  ), model
)

# パイプオペレータ(%>%)を用いて、2015年のHondaのAcuraを対象に、最も良い高速道路のMPG(Miles per galon)のモデルを抽出して下さい
best_model <- filter(vehicles, make == "Acura", year == 2015) %>%
  filter(hwy == max(hwy)) %>%
  select(model)

### ボーナスエクササイズ

# 上記3つの処理を関数として定義して下さい

## 一時変数
temp_vars_best_model <- function() {
  acuras <- filter(vehicles, make == "Acura", year == 2015)
  best.acura <- filter(acuras, hwy == max(hwy))
  best.model <- select(best_acura, model)
}

## `dplyr`とネスト関数
nested_best_model <- function() {
  best_model <- select(
    filter(
      filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy)
    ), model
  )
}

## パイプオペレータ(%>%)
pipe_best_model <- function() {
  best_model <- filter(vehicles, make == "Acura", year == 2015) %>%
    filter(hwy == max(hwy)) %>%
    select(model)
}

# 定義した3つの関数を１０００回実行して処理時間を比較して下さい
system.time(for (i in 1:1000) temp_vars_best_model())
system.time(for (i in 1:1000) nested_best_model())
system.time(for (i in 1:1000) pipe_best_model())
