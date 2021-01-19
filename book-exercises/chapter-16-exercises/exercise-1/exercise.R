# エクササイズ1: このエクササイズでは`ggplot2`というライブラリを用いてデータ可視化について学んでいきます

# `ggplot2`パッケージをインストール、ロードして下さい
install.packages("ggplot2")
library("ggplot2")

# `dplyr`パッケージをロードして下さい
library("dplyr")

# このエクササイズでは`ggplot`ライブラリに含まれている`diamonds`データセットを用います
# `?diamonds`コマンドでデータセットに関する理解を深めて下さい
# また、データセットの列名や行数を確認して下さい
?diamonds
colnames(diamonds)
nrow(diamonds)

# このデータセットには膨大な行数があります
# そのため、`diamonds_sample`という変数に、`diamonds`からランダムに抽出した１０００行を代入して下さい
# ランダムに行を抽出するには`sample_n()`を用いて下さい
diamonds_sample <- sample_n(diamonds, 1000)

# `diamonds_sample`を対象に散布図を描画して下さい
# この時、x軸には`carat`をy軸には`price`を指定して下さい
ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x = carat, y = price))

# 上の散布図を、`clarity`で色分けして下さい
ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x = carat, y = price, color = clarity))

# `diamonds`を対象に、上と同じ散布図を再度描画して下さい
# 散布図の描画には時間がかかる場合があります
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price, color = clarity))

# `diamonds_sample`を対象に散布図を描画して下さい
# この時、x軸には`carat`を、y軸には`price`を、散布図の各点の色に青色を指定して下さい
ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x = carat, y = price), color = "blue")

# `diamonds_sample`を対象に散布図を描画して下さい
# この時、x軸には`carat`を、y軸には`price`を、各点の形状には`cut`を指定して下さい
ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x = carat, y = price, shape = cut))

# `diamonds_sample`を対象に散布図を描画して下さい
# この時、x軸には`carat`を、y軸には`cut`を、各点のサイズに`price`を指定して下さい
ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x = carat, y = cut, size = price))

# この散布図の各点を`price`を用いて色をつけてください
ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x = carat, y = cut, size = price, color = price))

# `diamonds_sample`を対象に折れ線グラフを描画して下さい
# この時、x軸には`carat`を、y軸には`price`を、色には`cut`を指定して下さい
ggplot(data = diamonds_sample) +
  geom_line(mapping = aes(x = carat, y = price, color = cut))

# 上のグラフを`geom_line()`ではなく、`geom_smooth()`で描き直してください
ggplot(data = diamonds_sample) +
  geom_smooth(mapping = aes(x = carat, y = price, color = cut))

# `diamonds_sample`を対象に棒グラフを描画して下さい
# この時、x軸には`cut`を、y軸には`price`を指定して下さい
# この棒グラフを描画すると、y軸は各`carat`別の`price`の合計になります！
ggplot(data = diamonds_sample) +
  geom_col(mapping = aes(x = cut, y = price))

# この棒グラフを対象に、fillに`clarity`を指定して再度描画してみて下さい
ggplot(data = diamonds_sample) +
  geom_col(mapping = aes(x = cut, y = price, fill = clarity))

# `diamonds_sample`を対象に散布図と線グラフ(`geom_smooth()`)を描画して下さい
# この時、それぞれのグラフのx軸には`carat`を、y軸には`price`を、色には`cut`を指定して下さい
ggplot(data = diamonds_sample) +
  geom_point(mapping = aes(x = carat, y = price, color = cut), alpha = 0.3) +
  geom_smooth(mapping = aes(x = carat, y = price, color = cut), se = FALSE)

## ボーナスエクササイズ

# `clarity`別のダイヤモンドの平均価格を算出し、`clarity_summary`という変数に代入して下さい
# この時、価格の標準偏差と標準誤差も算出して下さい
# 標準偏差は`sd()`で、標準誤差は標準偏差を`price`の個数の平方根で割ったものになります
clarity_summary <- diamonds %>%
  group_by(clarity) %>%
  summarize(mean = mean(price), sd = sd(price), se = sd / sqrt(length(price)))

# `clarity_summary`を対象に棒グラフを描画して下さい
# また、geom_errorbar()を用いて標準誤差を棒グラフに重ね書きして下さい
ggplot(data = clarity_summary, mapping = aes(x = clarity, y = mean)) +
  geom_bar(mapping = aes(fill = clarity), stat = "identity") +
  geom_errorbar(mapping = aes(ymin = (mean - se), ymax = (mean + se)))
