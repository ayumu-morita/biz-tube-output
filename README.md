# アプリケーション名
biz-tube-output

# アプリケーション概要
ビジネス系YouTuberを視聴して学んだことを投稿できるアウトプットサイト

# URL
https://biztube-output.herokuapp.com/

# テスト用アカウント
## basic認証
user = admin
pass = 2222

# 利用方法
ログインしているユーザーが投稿、編集、投稿削除できる。
またログインユーザーは他人の投稿にコメントできる

# 目指した課題解決
昨今ビジネス系のYouTuberが流行しているが、インプットと同じくらいアウトプットが大事だと考え、アウトプットの場を作りたかった。
学んだことのアウトプットにより自分の恥肉にすることはもちろん、他人のアウトプットを見て視聴するかどうかなど参考にすることができる。
本アプリのペルソナである勉強意欲の高い人たちにとって高め合えるコミュニティにもなると考えている。

# 洗い出した要件
|機能|目的|詳細|ストーリー|
| :---: | :---: | :---: | :---: |
|投稿機能|アウトプットすることで学びを定着させる|ログインしているユーザーは投稿できる|投稿ボタンから投稿したいテキストを入力して投稿できる|
|投稿削除|不要な投稿を削除|必要のない投稿を削除できる|投稿一覧ページから削除ボタンを押すと不要な投稿を削除できる|
|投稿編集|投稿内容を編集|投稿内容を投稿編集ページから編集できる|自分が投稿した投稿を編集ボタンを押すことで編集できる|
|投稿詳細表示|投稿の詳細を表示|投稿詳細ページからはコメントができる|投稿の詳細をみることができる|
|ユーザー新規登録|ユーザを登録させる|ユーザーを登録できる|新規登録ボタンからユーザー情報を登録できる|
|ログイン・ログアウト|アカウントの切り替え|登録ユーザーはログイン・ログアウトができる|ログイン、ログアウトボタンから各操作が実行できる|
|投稿へコメント|ユーザー間コミュニケーション|詳細ページから投稿にコメントをすることができる|投稿詳細ページにあるコメント欄にコメントを記入してコメントできる|
<!-- |投稿検索|||| -->

# 実装した機能についてのGIFと説明

# 実装予定の機能

# データベース設計
# ER図
https://gyazo.com/b539d4eee723354571b951a0cd0c2599

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :posts
- has_many :comments

## posts テーブル

| Column  | Type      | Options                        |
| ------  | --------- | ------------------------------ |
| URL     | text      | null: false                    |
| text    | text      | null: false                    |
|question1| text      | null: true                    |
|question2| text      | null: true                    |
| user    | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

# ローカルでの動作方法