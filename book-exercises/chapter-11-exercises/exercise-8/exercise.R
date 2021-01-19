# エクササイズ8: このエクササイズではR言語のパッケージであるdplyrを用いて、Pulitzer Prize Winning Newspapersのデータセットを処理していきます。

# `dplyr`パッケージをロードする
library(dplyr)

# `pulitzer`という変数に、read.csv()を用いて`data/pupulitzer-circulation-data.csv`をロードして下さい
pulitzer <- read.csv("data/pulitzer-circulation-data.csv", stringsAsFactors = FALSE)

# `View()`を用いて`pulitzer`変数の中身を確認して下さい
View(pulitzer)

# `pulitzer`データフレームの列名を確認して下さい
colnames(pulitzer)

# データフレームの各列に含まれている値を`str()`を用いて確認して下さい
str(pulitzer)

# `Pulitzer.Prize.Change`という列を新たに作成し、この列に1990-2003から2004-2014の間でのPulitzer.Prize.Winners.and.Finalistsが変化を代入して下さい
mutate(pulitzer,
  Pulitzer.Prize.Change =
    Pulitzer.Prize.Winners.and.Finalists..2004.2014 -
      Pulitzer.Prize.Winners.and.Finalists..1990.2003
)

# "Pulitzer.Prize.Winners.and.Finalists..2004.2014"が最大であった新聞("Newspaper")を抽出して下さい
filter(pulitzer, max(Pulitzer.Prize.Winners.and.Finalists..2004.2014) ==
  Pulitzer.Prize.Winners.and.Finalists..2004.2014) %>%
  select(Newspaper)

# "Pulitzer.Prize.Winners.and.Finalists..2004.2014"が５以上の新聞("Newspaper")の中で、最も"Change.in.Daily.Circulation..2004.2013"が低下した新聞("Newspaper")を抽出して下さい
filter(pulitzer, Pulitzer.Prize.Winners.and.Finalists..2004.2014 >= 5) %>%
  filter(min(Change.in.Daily.Circulation..2004.2013) == Change.in.Daily.Circulation..2004.2013) %>%
  select(Newspaper)

# データサイエンティストとして一番大事なことは、自分自身でデータセットに対する問いを立てることです
# 自分自身でこのデータセットに対する問いを立てて、その問いに対して`dplyr`を用いて答えてみて下さい！

