# エクササイズ1: このエクササイズではKaggleからダウンロードしてきたアボカドの価格のデータを対象に、`tidyr`を用いてデータを整形します。

# 必要なパッケージをロードして下さい(`tidyr`, `dplyr`, `ggplot2`)

# RStudioのメニューからワーキングディレクトリを指定して下さい
# Session > Set Working Directory > To Source File Location


# csv.read()を用いて`data/avocado.csv`をロードし、`avocados`という変数に代入して下さい


# `avocados`データフレームの`Date`列を`as.Date()`と`mutate()`を用いてdate型にして下さい


# `avocados`データフレームの列名を以下のように変更して下さい
# `X4046` から `small_haas` へ
# `X4225` から `large_haas` へ
# `X4770` から `xlarge_haas` へ


# `avocados`データフレームにはハスアボカド以外の総売上の列がありません
# `other_avos`という列名を新たに作成し、この列にハスアボカド以外の総売上の値を代入して下さい


# アボカドのサイズ別の分析を実施するために、以下の列のみを持つ`by_size`という変数名のデータフレームを作成して下さい
# `Date`, `other_avos`, `small_haas`, `large_haas`, `xlarge_haas`


# `by_size`データフレームを可視化するために、このデータフレームを整形していきます
# `gather()`を用いて`other_avos`, `small_haas`, `large_haas`, `xlarge_haas`を縦持ちのデータフレームに整形して下さい
# これらの列名は`size`という列に値を代入して下さい
# `other_avos`, `small_haas`, `large_haas`, `xlarge_haas`の列に入っている売上の値は、新しく作成する`volume`という列に代入して下さい
# 新しく作成するデータフレームの変数名は`size_gathered`として下さい


# アボカドのサイズ別の総売上の平均値を算出して下さい
# ヒント: `group_by()`を用いて`size`でグルーピング処理をし、`summarize()`を用いて平均値を算出して下さい


# 時系列の総売上の変化を可視化します
# (このコードの書き方は第16章で説明します)
ggplot(size_gathered) +
  geom_smooth(mapping = aes(x = Date, y = volume, col = size), se = F) 


# アボカドのタイプ別(conventional, organic)の分析を実施するために、`by_type`という変数名のデータフレームを作成して下さい
# `by_type`データフレームを作成するために、`Date`と`type`列でグルーピング処理をし、`Total.Volume`の合計値を算出して下さい


# アボカドのタイプ別(conventional, organic)で売上を比較するために、`spread()`を用いて`type`を横持ちとするデータフレームに整形して下さい
# 新しく作成するデータフレームの変数名は`by_type_wide`として下さい


# アボカドのタイプ別(conventional, organic)での売上を散布図で可視化して比較します
# (このコードの書き方は第16章で説明します)
ggplot(by_type_wide) +
  geom_point(mapping = aes(x = conventional, y = organic, color = Date)) 
