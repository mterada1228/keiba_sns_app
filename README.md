# README

## 本アプリについて

本アプリは **競馬予想投稿アプリ** です。
レースを選んで馬印の作成、買い目、予想コメントをみんなにシェアしよう！
また、気になるユーザをフォロー、予想をお気に入り登録して実際に馬券を購入する際に参考にすることもできます。

## アプリの実施方法

### 本番環境のURL
http://18.177.202.110/

### 開発環境での実行方法

以下コマンドを順番に実施してください。

1. git clone https://github.com/mterada1228/keiba_sns_app.git
2. docker-compose up --build
3. docker-compose exec web bundle exec rails db:create (# 初回のみ実行)
4. docker-compose exec web bundle exec rails db:migrate
5. docker-compose exec web bundle exec rails db:seed
6. ブラウザより、http://localhost:3000/にアクセス

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
