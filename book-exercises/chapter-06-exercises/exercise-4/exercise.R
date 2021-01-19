# エクササイズ4: R言語での条件分岐処理の書き方

# is_twice_as_longという関数を定義して下さい
# この関数では、引数に二つの文字列、返り値をTRUEかFALSEの論理値とする関数として下さい
# この関数では、片方の文字列の長さがもう片方の文字列の長さより2倍以上であればTRUE、そうでなければFALSEとして下さい
is_twice_as_long <- function(str1, str2) {
  diff <- abs(nchar(str1) - nchar(str2))
  min_length <- min(nchar(str1), nchar(str2))
  diff >= min_length # 返り値
}

# is_twice_as_long()を用いて二つの文字列のうち、片方の文字列の長さがもう片方の文字列の長さより2倍以上であるかを確認しましょう！
is_twice_as_long("dog", "elephant")
is_twice_as_long("elephant", "dog")
is_twice_as_long("dog", "cat")

# describe_differenceという関数を定義して下さい
# この関数では、引数に二つの文字列、返り値は以下の文字列のどれかとする関数として下さい
#   "第一引数の文字列は、第二引数の文字列よりN文字多い！"
#   "第二引数の文字列は、第一引数の文字列よりN文字多い！"
#   "第一引数と第二引数の文字列の長さは同じ！"
describe_difference <- function(first, second) {
  diff <- nchar(first) - nchar(second)
  if (diff > 0) {
    sentence <- paste("第一引数の文字列は、第二引数の文字列より", diff, "文字多い！")
  } else if (diff < 0) {
    sentence <- paste("第二引数の文字列は、第一引数の文字列より", -diff, "文字多い！")
  } else {
    sentence <- "第一引数と第二引数の文字列の長さは同じ！"
  }
  sentence # 返り値
}

# describe_difference()が正常に動作するか確認して下さい
# 上記3つの文字列がきちんと返り値として返ってくるか確かめてみましょう
describe_difference("dog", "elephant")
describe_difference("elephant", "dog")
describe_difference("dog", "cat")
