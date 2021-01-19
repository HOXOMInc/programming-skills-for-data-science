# エクササイズ2: このエクササイズでは`ggplot2`ライブラリを用いて高度なデータ可視化技術を学んでいきます

# `ggplot2`パッケージをインストールしロードする
#install.packages('ggplot2')
library("ggplot2")


# このエクササイズでも`diamonds`データセットを用います
# `?diamonds`コマンドを用いてデータセットの詳細を確認して下さい
?diamonds

## 位置調整

# `diamonds`を対象に積み上げ棒グラフを描画して下さい
# この時、x軸には`cut`を、y軸には`price`を、fillは`clarity`を指定して下さい
ggplot(data = diamonds) +
  geom_col(mapping = aes(x = cut, y = price, fill = clarity))

# 上と同じグラフを `position = "fill"` として描画し直して下さい
ggplot(data = diamonds) +
  geom_col(mapping = aes(x = cut, y = price, fill = clarity), position = "fill")

# 上と同じグラフを `position = "dodge"` として描画し直して下さい
ggplot(data = diamonds) +
  geom_col(mapping = aes(x = cut, y = price, fill = clarity), position = "dodge")

# `diamonds`を対象に積み上げ散布図を描画して下さい
# この時、x軸には`cut`を、y軸には`clarity`を指定して下さい
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = cut, y = clarity))

# 上と同じグラフを `position = "jitter"` として描画し直して下さい
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = cut, y = clarity), position = "jitter")

## スケール(目盛り)

# `diamonds`を対象に箱ひげ図(`geom_boxplot()`)を描画して下さい
# この時、x軸には`color`を、y軸には`price`を指定して下さい
ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(x = color, y = price))

# このデータセットには多数の外れ値が含まれており箱ひげ図が読みづらくなっています
# そのため、y軸に対数スケール（目盛り）を設定して再度箱ひげ図を描画して下さい
ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(x = color, y = price)) +
  scale_y_log10()

# 上と同じグラフをバイオリンプロットで描画し直して下さい
ggplot(data = diamonds) +
  geom_violin(mapping = aes(x = color, y = price)) +
  scale_y_log10()

# `diamonds`を対象に`geom_bin2d()`を用いてヒートマップを描画して下さい
# この時、x軸には`carat`を、y軸には`price`を指定して下さい
# また、x軸、y軸それぞれ対数スケール（目盛り）にした時のヒートマップも描画して下さい
ggplot(data = diamonds) +
  geom_bin2d(mapping = aes(x = carat, y = price)) +
  scale_x_log10() +
  scale_y_log10()

# `diamonds`を対象に散布図を描画して下さい
# この時、x軸には`carat`を、y軸には`price`、色に`clarity`を指定して下さい
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price, color = clarity))

# `scale_color_brewer()`を用いて上の散布図を塗り直して下さい
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price, color = clarity)) +
  scale_color_brewer(palette = "Spectral")

## 座標系

# `diamonds`を対象に棒グラフ(`geom_bar()`)を描画して下さい
# この時、x軸とfillには`cut`を指定して下さい
# また、`width`オプションを1にして下さい
bar <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut), width = 1)
bar

# 上と同じグラフをx軸とy軸を反転させて描画し直して下さい
bar + coord_flip()

# 上と同じグラフを極座標系を用いて描画し直して下さい
bar + coord_polar()

## ファセット

# `diamonds_sample`を対象に積み上げ散布図を描画して下さい
# この時、x軸には`cut`を、y軸には`price`、色は`clarity`を指定して下さい
# また、ファセットを用いて`color`別にグラフを描画して下さい
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price, color = clarity)) +
  scale_color_brewer(palette = "Spectral") +
  facet_wrap(~ color)

## 画像の保存

# `ggsave()`を用いて画像を保存して下さい
# この時、保存する画像のファイル名は"my-plot.png"として下さい
ggsave("my-plot.png")
