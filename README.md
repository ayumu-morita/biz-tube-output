# biztube-output
![BizTubeOutput.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/542843/db1c2dd3-7729-84bb-a8b0-f377c924ba4c.png)

# アプリケーション概要
ビジネス系YouTubeを視聴して学んだことを投稿できるアウトプットサイト

# URL
biztube-output.work
https://biz-tube-output.herokuapp.com/

# 使用技術
## フロントエンド
- HTML/CSS
- JavaScript(jQuery)
## バックエンド
- Ruby 2.6.5
- Rails 6.0.3
## webサーバー
- Nginx : 1.18.0
## アプリケーションサーバー
- （開発環境）Puma : 4.3.3
- （本番環境）Unicorn : 5.4.1
## データベース
- （開発環境）MySQL 5.6.47
- （本番環境）MariaDB : 5.5.64
## インフラ
- AWS (EC2, VPC, Route53, ACM, ELB)
- Git, GitHub
- Capistrano : 3.14.1

## その他
AWS(Route53, ALB, ACM)を利用したHTTPS接続

# インフラ構成
![Untitled_Diagram_drawio_-_diagrams_net.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/542843/b6d1e6c4-7320-ee09-2684-a4ef78148b42.png)

# テスト用アカウント

## テストユーザー
ゲストログイン機能を実装しました。

email = test@gmail.com
pass = aaaa1111

email = abc@gmail.com
pass = aaaa1111
# 利用方法
ログインしているユーザーが投稿、編集、投稿削除できる。
ログインしてなくても投稿は見れる
またログインユーザーは他人の投稿にコメントできる

# 目指した課題解決
昨今ビジネス系のYouTuberが流行しているが、インプットと同じくらいアウトプットが大事だと考え、アウトプットの場を作りたかった。
学んだことのアウトプットにより自分の血肉にすることはもちろん、他人のアウトプットを見て視聴するかどうかなど参考にすることができる。
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

# 実装した機能についてのGIF
![ezgif.com-gif-maker.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/542843/df730429-a933-3e31-0ef1-59f4fe67dc36.gif)


# 実装予定の機能
* いいね機能
* コメントボタン設置

# データベース設計
# ER図
![Untitled_Diagram_drawio_-_diagrams_net_-_Gyazo.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/542843/cbb4867f-2a07-6ccb-e6a9-69f82d21f4c4.png)

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
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
Ruby 2.6.5
rails 6.0.3.3

gem 'pry-rails'

gem 'devise'

gem 'rails-i18n'

bundle installを実行

rails db:create

rails db:migrate

rails sを実行
