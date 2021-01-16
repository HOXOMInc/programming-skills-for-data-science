# エクササイズ3: このエクササイズではR言語のパッケージであるdplyrのパイプオペレータの使い方を学んでいきます。

# `dplyr`パッケージをインストールしてロードする
#install.packages("dplyr")
library("dplyr")

# `fueleconomy`パッケージをインストールしてロードする
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library("fueleconomy")

# 一時変数を用いて、2015年のHondaのAcuraを対象に、最も良い高速道路のMPG(Miles per galon)のモデルを抽出して下さい


# `dplyr`とネスト関数を用いて、2015年のHondaのAcuraを対象に、最も良い高速道路のMPG(Miles per galon)のモデルを抽出して下さい


# パイプオペレータ(%>%)を用いて、2015年のHondaのAcuraを対象に、最も良い高速道路のMPG(Miles per galon)のモデルを抽出して下さい


### ボーナスエクササイズ

# 上記3つの処理を関数として定義して下さい

## 一時変数


## `dplyr`とネスト関数


## パイプオペレータ(%>%)


# 定義した3つの関数を１０００回実行して処理時間を比較して下さい

