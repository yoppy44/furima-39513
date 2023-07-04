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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | string | null: false |

### Association
- has_many :items
- has_many :cards
- has_many :recipients

## items テーブル

| Column                  | Type    | Options     |
| ----------------------- | ------- | ----------- |
| item_name               | string  | null: false |
| price                   | integer | null: false |
| delivery_charge_id      | integer | null: false |
| explanation             | text    | null: false |
| seller_name             | string  | null: false |
| category_id             | integer | null: false |
| quality_id              | integer | null: false |
| shipping_origin_area_id | integer | null: false |
| delivery_date_id        | integer | null: false |

### Association
- belongs_to :user
- has_one :card

## cards テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| card_num     | integer | null: false |
| card_period  | integer | null: false |
| security_num | integer | null: false |

### Association
- belongs_to :user
- has_one :item
- has_one :recipient

## recipients テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_cord          | string  | null: false |
| prefectures        | integer | null: false |
| municipalities     | string  | null: false |
| address            | string  | null: false |
| building_name      | string  | ----------- |
| telephone_number   | integer | null: false |

### Association
- belongs_to :user
- has_one :card