# エクササイズ1: このエクササイズでは plotly というライブラリを用いてインタラクティブなデータ可視化について学んでいきます

# `dplyr`, `ggplot2`, `plotly`パッケージをロードして下さい


# RStudioのメニューからワーキングディレクトリを指定して下さい
# Session > Set Working Directory > To Source File Location


# `read.csv()`を用いて、`mortality_rates`という変数に`"data/IHME_WASHINGTON_MORTALITY_RATES_1980_2014.csv`をロードして下さい


# 今回扱うデータセットは膨大なデータセットですが、今回扱うのはデータセットの一部になります
# そのため、`mortality_rates`データフレームのうち、以下の条件に合致する行と列を抽出し、`plot_data`という変数に代入して下さい
# 分析対象の行
# - `location_name` が "King County" の行
# - `sex` が "Both" でない行
# - `cause_name` が "Neoplasms" の行
# - `year_id` が 2004 以上の行
# 分析対象の列
# - `sex`, `year_id`, `mortality_rate`


# `ggplot2`を用いて年(`yead_id`)毎の性別(`sex`)別の死亡率(`mortality_rate`)を可視化して下さい
# 作成した可視化の結果は、`mort_plot`という変数に代入して下さい
# ヒント: 16章で学んだ棒グラフのオプションである"dodge"を使うと良いでしょう！


# `ggplotly()`を用いて`mort_plot`を動的な可視化に変換して下さい


# `plotly`パッケージの`plot_ly()`を用いて上の動的な可視化と同等な動的な可視化を実現して下さい
# この時、x軸には年(`yead_id`)、y軸には死亡率(`mortality_rate`)、色には性別(`sex`)を指定して下さい


# 作成したグラフにタイトル、x軸、y軸の説明を追加して下さい

