# README

# metta DB設計
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

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true, null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

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
