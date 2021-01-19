# エクササイズ3: R言語での関数の書き方と実行方法

# add_threeという関数を定義して下さい
# この関数では、引数に３を足した値を返り値とする関数として下さい
add_three <- function(value) {
  value + 3 # 返り値
}

# add_three()を用いて7に３を足し、足した値をtenという変数に代入して下さい
ten <- add_three(7)

# imperial_to_metricという関数を定義して下さい
# この関数では、feetとinchesという変数を引数とし、返り値をmetersとして下さい
# この関数では、フィートとインチをメートルに変換します。
# ヒント: https://ja.wikipedia.org/wiki/%E3%83%95%E3%82%A3%E3%83%BC%E3%83%88
imperial_to_metric <- function(feet, inches) {
  total_inches <- feet * 12 + inches
  meters <- total_inches * 0.0254
  meters # 返り値
}

# imperial_to_metric()を用いてあなたの身長をメートルに変換し、height_in_metersという変数に代入して下さい
height_in_meters <- imperial_to_metric(5, 11)
