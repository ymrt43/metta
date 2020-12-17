# Mettā
<img width="633" alt="metta-logo" src="https://user-images.githubusercontent.com/66734795/102176170-37871f80-3ee4-11eb-837b-bfd816faac1c.png">
  ヨガ教室Mettā(仮)の予約アプリケーション

# 概要
  - 教室運営者：レッスン情報を登録
  - お客様　　：公開されたレッスンを予約

# 本番環境
- URL: https://metta-yogastudio-app.herokuapp.com/
- テスト用アカウント
  - ID:guest1@test
  - PW:guest1

# 制作背景
  ヨガインストラクターの友人が個人で運営する教室の予約システムをアプリケーションで簡易化したいと考えた

# 工夫したポイント
  ヨガ教室をカテゴリーに分け、ユーザーが検索しやすい様にインクリメンタルサーチを実装

# 使用技術
  ### 開発環境
    Ruby/Ruby on Rails/MySQL/Github/Heroku/Visual Studio Code

# 今後実装したい機能
  - システム管理者専用機能
  - カレンダー機能

# 課題
  - SNSのAPIを本番環境で有効化

# DB設計
![metta_er](https://user-images.githubusercontent.com/66734795/99940532-ad99da00-2daf-11eb-808f-1b7ff59075e1.png)


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_one :profile
- has_one :card
- has_many :sns_credentials
- has_many :reservations

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|phone_num|string|null: false|
|zipcode|intger|null: false|
|date_of_birth|date|null: false|
|user_id|refernces|foreign_key: true|
### Association
- belongs_to :user, optional: true

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|provider|string|null: false|
|uid|string|null: false|
### Association
- belongs_to :user, optional: true

## lessonsテーブル
|Column|Type|Options|
|------|----|-------|
|level|integer|null: false|
|capacity|integer|null: false|
|date|date|null: false|
|start_time|time|null: false|
|end_time|time|null: false|
|fee|integer|null: false|
|lesson_introduction|text|index: true|
|course_id|references|null: false, foreign_key: true|
|fully_booked|boolean|default: false, null: false|
### Association
- has_many :reservations
- belongs_to :course

## coursesテーブル
|Column|Type|Options|
|------|----|-------|
|course_name|string|null: false, index: true|
|introduction|text|null: false|
|src|string|null: false|
### Association
- has_many :lessons

## reservationsテーブル
|Column|Type|Options|
|------|----|-------|
|count|integer|null: false|
|lesson_id|references|null: false, foregin_key: true|
|user_id|references|null: false, foregin_key: true|
### Association
- has_many :lessons
- has_many :users
