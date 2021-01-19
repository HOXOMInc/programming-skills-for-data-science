# エクササイズ1

このエクササイズではgitを用いてリポジトリをクローンしたり編集したりする練習をします。

1. ターミナルを使ってGitHubアカウントの名前とメールアドレスを設定して下さい。

```bash
# GitHubのアカウント名を設定する
git config --global user.name "your-full-name"

# GitHubのメールアドレスを設定する
git config --global user.email "your-email-address"
```

2. GitHubのインターフェースにあるforkボタンをクリックし、このリポジトリを自分のGitHubアカウントにフォークして下さい。

```bash
#  「フォークボタン」をクリックして、自分のGitHubアカウントにフォークします
```

3. ターミナルを使ってフォークしたリポジトリをローカルの開発環境にクローンして下さい。

```bash
# 希望のディレクトリに移動する
cd ~/Documents

# リポジトリをクローンする
git clone https://github.com/YOUR-USER-NAME/YOUR-REPO.git
```

4. ローカルの開発環境で、このファイル (`exercise-1/README.md`) をテキストエディタで開いて下さい。

```bash
# ファイルをテキストエディタで開く
```

5. テキストエディタで `README.md` ファイルを開いたら、このファイルに今日の朝食に食べたものを追記して下さい。

```markdown
1. Coffee
2. Milk
3. Cheerios
4. Coffee
5. Banana
6. Coffee
7. Coffee
```

6. ターミナルを使ってこの変更をコミットして下さい。

```bash
# クローンリポジトリにいることを確認する
pwd
cd YOUR-REPO

# リポジトリ内の全ファイルの変更を追加する
git add .

# コミットメッセージと共に変更をコミットする
git commit -m "Adds breakfast"
```

7. GitHub にコミットをプッシュしウェブブラウザで確認して下さい。

```bash
# コミットをGitHubにプッシュする
git push origin master
```
