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

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| password_confirmation | string | null: false |

### Association

- has_one  :profile
- has_many :comments
- has_one  :credit_card,                                           foreign_key: "buyer_id", class_name: "Item"
- has_one  :shipping_address,                                      foreign_key: "buyer_id", class_name: "Item"
- has_many :buyed_items, through: :credit_card :shipping_address,  foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") },        foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items,   -> { where("buyer_id is not NULL") },    foreign_key: "saler_id", class_name: "Item"



## profile テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| last_name   | string     | null: false                    |
| first_name  | string     | null: false                    |
| birth_year  | string     | null: false                    |
| birth_month | string     | null: false                    |
| birth_day   | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user



## credit_card テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_day  | string     | null: false                    |
| expiration_year | string     | null: false                    |
| security_code   | string     | null: false                    |
| buyer_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer,                                                                         class_name: "User"
- has_many   :buyed_items, through: :credit_card :shipping_address, foreign_key: "buyer_id", class_name: "Item"



## shipping_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| municipaliyty | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| buyer_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer,                                                                         class_name: "User"
- has_many   :buyed_items, through: :credit_card :shipping_address, foreign_key: "buyer_id", class_name: "Item"



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| image               | string     | null: false                    |
| state               | string     | null: false                    |
| postage             | string     | null: false                    |
| region              | string     | null: false                    |
| shipping_date       | string     | null: false                    |
| price               | string     | null: false                    |
| credit_card_id      | references | null: false, foreign_key: true |
| shipping_address_id | references | null: false, foreign_key: true |
| buyer_id            | references | null: false, foreign_key: true |
| saler_id            | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- belongs_to :credit_card
- belongs_to :shipping_address_id
- belongs_to :buyer, class_name: "User"
- belongs_to :saler, class_name: "User"



## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
