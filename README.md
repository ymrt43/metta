# README

# metta DB設計
![metta_er](https://user-images.githubusercontent.com/66734795/99392066-76927700-291e-11eb-8797-8d884ae31d6a.png)


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
- has_many :lessons_users
- has_many :lessons, through: :lessons_users

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|date_of_birth|date|null: false|
|gender|intger|null: false|
|user_id|refernces|foreign_key: true, null: false|
### Association
- belongs_to :user

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
|lesson_name|string|null: false|
|lesson_level|integer|null: false|
|lesson_capacity|integer|null: false|
|lesson_date|date|null: false|
|lesson_start_time|time|null: false|
|lesson_end_time|time|null: false|
|lesson_fee|integer|null: false|
|lesson_introduction|text|null: false|
|instructor_id|references|null: false, foreign_key: true|
|fully_booked|boolean|default: false, null: false|
### Association
- has_many :lessons_users
- has_many :users, through: :lessons_users
- belongs_to :instructor

## lessons_usersテーブル
|Column|Type|Options|
|------|----|-------|
|lesson_id|references|null: false, foregin_key: true|
|user_id|references|null: false, foregin_key: true|
### Association
- has_many :lessons
- has_many :users

## instructorsテーブル
|Column|Type|Options|
|------|----|-------|
|instructor_name|string|null: false|
|instructor_gender|integer|null: false|
|instructor_history|text|null: false|
|instructor_image|string|null: false|
### Association
- has_many :lessons
