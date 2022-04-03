# README

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


# テーブル設計


## users テーブル

| Column             | Type       | Options                                   |
| ------------------ | ---------- | ----------------------------------------- |
| nickname           | string     | null: false                               |
| email              | string     | null: false, unique: true                 |
| encrypted_password | string     | null: false                               |
| last_name          | string     | null: false, with: /\A[ぁ-んァ-ヶ一-龥]/+\z |
| first_name         | string     | null: false, with: /\A[ぁ-んァ-ヶ一-龥]/+\z |
| last_name          | string     | null: false, with: /\p{katakana}/         |
| first_name         | string     | null: false, with: /\p{katakana}/         |
| birth_year_id      | integer    | null: false                               |
| birth_month_id     | integer    | null: false                               |
| birth_day_id       | integer    | null: false                               |


### Association

has_many :buyers
- has_many :comments
- has_many :items, through: :buyers



## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | string     | null: false                    |
| region_id     | integer    | null: false                    |
| municipaliyty | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :items



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| state_id            | integer    | null: false                    |
| postage_id          | integer    | null: false                    |
| region_id           | integer    | null: false                    |
| shipping_date_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| buyer               | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :buyer
- has_many   :comments



## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
