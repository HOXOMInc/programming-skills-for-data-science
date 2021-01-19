# エクササイズ２: このエクササイズではR言語の`*apply()`の使い方を学んでいきます

# `runif()`を用いて10個の乱数を生成し、`as.list()`を用いてリスト変数として保存して下さい
nums <- as.list(runif(10, 1, 100))

# `lapply()`を用いてリスト変数の各要素に対して`round()`を適用し、小数点第一位で四捨五入して下さい
lapply(nums, round, 1)

# `sentence`という変数に英語で長い文章を代入し、小文字に変換して下さい
sentence <- tolower("I do not like green eggs and ham. I do not like them, Sam-I-Am")

# `strsplit()`を用いて`sentence`を一文字ずつの文字列を要素に持つベクトルに変換して下さい
# ヒント: 文字列を一文字ずつに分割するときは`""`を用いることで実現出来ます
# 注意点: この処理では要素数が1で要素が文字列のベクトルであるリストが返り値となります
letters_list <- strsplit(sentence, "")

# 一文字ずつの文字列を要素に持つベクトルを抽出して下さい
letters <- letters_list[[1]]

# `unique()`を用いてユニークな文字のベクトルを作成して下さい
letters_unique <- unique(letters)

# `count_occurrences()`を定義して下さい
# この関数は引数が2つあり、1つは長さ1の文字列と、もう1つは長さ1の文字列を要素とするベクトルです
# 関数の返り値は、第二引数のベクトルの要素で第一引数の文字列が何回出現するかをカウントした値になります
# ヒント: フィルタリングを用いましょう！
count_occurrences <- function(letter, all_letters) {
  length(all_letters[all_letters == letter])
}

# `count_occurrences()`を用いて`sentence`に'e'が何回出現するかカウントして下さい
count_occurrences("e", letters)

# `count_occurrences()`を`sapply()`に適用し、各文字がそれぞれ何回出現するかカウントして下さい
# `as.list()`を用いてカウントした結果をリスト変数に変換して下さい
frequencies <- as.list(sapply(letters_unique, count_occurrences, letters))

# `print()`を用いて結果を出力して下さい
print(frequencies)
