# README

## 本アプリについて

本アプリは **競馬予想投稿アプリ** です。
レースを選んで馬印の作成、買い目、予想コメントをみんなにシェアしよう！
また、気になるユーザをフォロー、予想をお気に入り登録して実際に馬券を購入する際に参考にすることもできます。

## アプリの実施方法

### 本番環境のURL
http://app.umatterkeiba.com/

### 開発環境での実行方法

以下コマンドを順番に実施してください。

1. git clone https://github.com/mterada1228/keiba_sns_app.git
2. docker-compose up --build
3. docker-compose exec web bundle exec rails db:create (# 初回のみ実行)
4. docker-compose exec web bundle exec rails db:migrate
5. docker-compose exec web bundle exec rails db:seed
6. ブラウザより、[http://localhost:3000/](http://localhost:3000/) にアクセス

## 機能説明

### レース選択
予想の閲覧、投稿したいレースの選択を行います。
開催日を選択し、希望の競馬場名を選択、最後にレースのラウンド数を選択してください。

### 予想の投稿
予想したいレースの選択をしたら、「レースを予想する」ボタンを選択してください。予想の投稿画面が開きます。
予想は「馬印」、「買い目」、「予想コメント」を投稿することができます。

* 馬印
  * 画面左側にレースに出走する馬の一覧が表示されます。各馬について「◎（本命）、◯（対抗）、▲、△（連穴）、×（大穴）」の評価を入力してください。
* 買い目
  * このレースにおける買い目を投稿できます。「買い目を選択」ボタンを押すと券種・買い方を選択することができます。選択すると出走馬の一覧から軸、相手を選択することで予想に買い目を登録することができます。
* 予想コメント
  * フリーフォーマットで予想を投稿することができます。調教内容や前走の評価など、予想の理由を自由に投稿できます。

### 投稿のお気に入り、返信機能
各予想のハートのアイコンをクリックすることで、投稿をお気に入りすることができます。
また返信のアイコンをクリックすると入力ページが立ち上がり、その投稿に対するコメントを返信することが可能です。

### 投稿詳細
投稿された予想のコメント部分をクリックすることで投稿の詳細を見ることができます。
投稿の一覧では表示されていなかった、「買い目」、「投稿に対する返信の一覧」を見ることができます。

### 会員登録 / 編集 / ログイン機能
* 会員登録
  * ヘッダの「会員登録」をクリックすると新規に会員登録することができます。フォームに従い会員登録を完了させてください。
* ログイン / ログアウト
  * ヘッダの「ログイン」より有効な「メールアドレス」、「パスワード」を入力することでログインできます。ログアウトは同様にヘッダの「ログアウト」をクリックすればできます。また **予想の投稿**、**投稿のお気に入り、返信機能**はログイン中でないと使えません。 
* 会員情報編集
  * サイドバーの「会員情報を変更する」をクリックすると、ログインユーザの登録情報を編集することができます。変更できる情報は「名前」と「メールアドレス」です。

### 会員検索 / ユーザページ / フォロー機能
* 会員検索
  * ヘッダの「会員検索」ボタンをクリックすると、登録済みのユーザーの一覧と検索バーが表示されます。検索バーのユーザ名を入力することで、対象のユーザの検索ができます。
* ユーザページ
  * 会員検索画面や、投稿のユーザ名をクリックすることでユーザページに遷移することができます。ユーザページには過去の投稿が投稿日順に表在されます。
* フォロー機能
  * 気になったユーザはユーザページより「フォローする」ボタンを押すことでフォロー可能です。またサイドバーの「フォロー」、「フォロワー」をクリックするとフォローしている / フォローされているユーザの一覧を見ることができます。

## 使用している技術について

### 本番環境
* インフラ：AWS
  * 構成図：[https://drive.google.com/file/d/1i035u41gV0ZIrWx_CGVef0eNkMujEf0I/view?usp=sharing](https://drive.google.com/file/d/1i035u41gV0ZIrWx_CGVef0eNkMujEf0I/view?usp=sharing)

### 開発環境
* docker
  * アプリケーション : image : ruby:2.5.3
  * DB：image : postgres:10.6

### CI/CD環境
* CircleCI
  * github への push 時に自動ビルド & 自動テストの実施 & 自動デプロイの実施

### アプリケーション内での使用技術

* 使用言語
  * ruby 2.5.3

* 画像投稿 / 編集
  * carrierwave 1.2.2
  * mini_magick 4.7.0

* ページネーション機能
  * will_paginate 3.1.6

* フレームワーク
  * Rails 5.1.6
  * bootstrap
  * jquery

* DB拡張
  * counter_culture

* デバッグ
  * byebug

* テスト
  * minitest