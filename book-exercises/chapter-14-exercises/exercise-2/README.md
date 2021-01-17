# エクササイズ2

このエクササイズではデータAPIの使い方を学んでいきます。今回扱うデータAPIは[New York Times API](https://developer.nytimes.com/)の映画のレビューデータになります。このAPIについて更に詳しく知りたい方は[developer console](https://developer.nytimes.com/movie_reviews_v2.json)を参照して下さい。

このエクササイズは、`exercise-2/exercise.R`に記載されていますので、そちらの指示に従って下さい。

## APIキーの取得

APIキーを取得するためにはこちらのURL **<https://developer.nytimes.com/accounts/create>** のフォームを入力してサインアップして下さい。サインアップが完了すると登録したメールアドレスにAPIキーが送付されます。

APIキーを取得したら `apikey.R` にAPIキーを保存しておいて下さい。`apikey.R` のファイルの中身は以下のようにして下さい。

```r
nty_apikey <- "my-api-key-as-a-string-inside-quotes"
```

最後になりますが、 `.gitignore` ファイルに `apikey.R` を追加するのを忘れないようにしましょう！
