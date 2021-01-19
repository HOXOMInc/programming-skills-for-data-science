# エクササイズ5: このエクササイズでは複雑なレイアウトや要素を持つShinyアプリを作成します

# `shiny`ライブラリをロードします
library("shiny")

# `source()`を用いて`app_ui.R` と `app_server.R` を実行して下さい
# これらのファイルそれぞれにUI関数とサーバ関数が定義されています
source("app_ui.R")
source("app_server.R")

# `ui`と`server`を`shinyApp()`の引数としてShinyアプリを作成して下さい
shinyApp(ui = ui, server = server)
