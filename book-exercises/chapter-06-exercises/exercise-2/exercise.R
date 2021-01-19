# エクササイズ2: R言語の関数を用いた文字列の操作方法

# lyricという変数に"I like to eat apples and bananas"という文字列を代入して下さい
lyric <- "I like to eat apples and bananas"

# substr()を用いてlyricの１文字目から１３文字目までを抽出して下さい
# 抽出した文字列はintroという変数に代入して下さい
# もしsubstr()の使い方に不明点がある場合、?substrを用いて調べてみて下さい
intro <- substr(lyric, 1, 13)

# substr()を用いてlyricの15文字目から最後の文字までを抽出して下さい
# 抽出した文字列はfruitsという変数に代入して下さい
# ヒント： nchar()を用いると変数の文字数を抽出することが出来ますよ！
fruits <- substr(lyric, 15, nchar(lyric))

# gsub()を用いてfruitsに代入されている文字列の"a"を"ee"に置換して下さい
# 置換した文字列をfruits_eという変数に代入して下さい
# ヒント： http://www.endmemo.com/program/R/sub.php
fruits_e <- gsub("a", "ee", fruits)

# gsub()を用いてfruitsに代入されている文字列の"a"を"oo"に置換して下さい
# 置換した文字列をfruits_oという変数に代入して下さい
fruits_o <- gsub("a", "o", fruits)

# introとfruits_eを繋げて新しくlyric_eという変数を作成して下さい
# 作成したlyric_eという変数をprint()を用いて出力して下さい
lyric_e <- paste(intro, fruits_e)
print(lyric_e)

# 新しい変数を作ることなく、introとfruits_eを繋げた文字列をprint()で出力して下さい
print(paste(intro, fruits_o))
