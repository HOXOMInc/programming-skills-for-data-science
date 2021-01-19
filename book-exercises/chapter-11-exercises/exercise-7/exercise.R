# エクササイズ7: このエクササイズではR言語のパッケージであるdplyrを用いて、2015-2016シーズンを対象に、NBAのチームの統計データを処理する方法を学んでいきます

# `dplyr`パッケージをロードして下さい
library(dplyr)

# `team_data`という変数に、`read.csv()`を用いて'nba_teams_2016.csv'を代入して下さい
team_data <- read.csv("data/nba_teams_2016.csv", stringsAsFactors = FALSE)

# View()を用いて`team_data`変数の内容を確認して下さい
# チーム名の後ろに"*"がついているチームは、その年にプレーオフに進出したチームになります
View(team_data)

# `team_data`の新しい列として、"turnovers to steals ratio"(TOV / STL)を追加して下さい
team_data <- mutate(team_data, Ratio = TOV / STL)

# `team_data`を"turnovers to steals ratio"で昇順にソートして下さい
# また、最も低い"turnovers to steals ratio"のチームを抽出して下さい
team_data %>%
  filter(Ratio == min(Ratio)) %>%
  select(Team)

# パイプオペレータ(%>%)を用いて、新しい列として一試合あたりのアシスト(AST / G)を追加し、追加した列の降順でソートして下さい
team_data <- mutate(team_data, ASTGM = AST / G) %>% arrange(-ASTGM)

# `good_offense`という変数に、シーズンで8700ポイント(PTS)以上だったチームを抽出して代入して下さい
good_offense <- filter(team_data, PTS > 8700)

# `good_defense`という変数に、シーズンで470ブロック(BLK)以上だったチームを抽出して代入して下さい
good_defense <- filter(team_data, BLK > 470)

# `offense_stats`という変数に、"Team"、"ORB"、"FG."、"AST"列を抽出したデータフレームを代入して下さい
offense_stats <- select(team_data, Team, ORB, FG., AST)

# `defense_stats`という変数に、"Team"、"DRB"、"STL"、"BLK"列を抽出したデータフレームを代入して下さい
defense_stats <- select(team_data, Team, DRB, STL, BLK)

# `better_shooters()`という関数を定義して下さい
# この関数は、２つのチーム名を引数とし、フィールドゴールパーセンテージ("FG.")が高い方のチーム名、ポイント(PTS)、フィールドゴールパーセンテージ("FG.")を返り値とします
better_shooters <- function(team1, team2) {
  better_team <- filter(team_data, Team %in% c(team1, team2)) %>%
    filter(FG. == max(FG.)) %>%
    select(Team, FG., PTS)

  better_team
}

# お気に入りの2つのチーム名を引数に、`better_shooters()`を実行して下さい
better.shooter <- BetterShooters("Golden State Warriors*", "Cleveland Cavaliers*")
better.shooter
