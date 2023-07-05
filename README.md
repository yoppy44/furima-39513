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

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| name               | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| first_name         | string | null: false  |
| last_name          | string | null: false  | 
| first_name_kana    | string | null: false  |
| last_name_kana     | string | null: false  |
| birthday           | date   | null: false  |

### Association
- has_many :items
- has_many :recipients

## items テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------- | ------------------------------ |
| item_name               | string  | null: false                    |
| price                   | integer | null: false                    |
| delivery_charge_id      | integer | null: false                    |
| explanation             | text    | null: false                    |
| seller_name             | string  | null: false, foreign_key: true |
| category_id             | integer | null: false                    |
| quality_id              | integer | null: false                    |
| shipping_origin_area_id | integer | null: false                    |
| delivery_date_id        | integer | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| purchase_name      | string | null: false, foreign_key: true |
| purchase_item      | string | null: false                    |

### Association
- belongs_to :user
- has_one : item

## recipients テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_cord          | string  | null: false |
| prefectures        | integer | null: false |
| municipalities     | string  | null: false |
| address            | string  | null: false |
| building_name      | string  | ----------- |
| telephone_number   | integer | null: false |
| recipient_name     | string  | null: false |

### Association
- belongs_to :user

