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

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               | 
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------- | ------------------------------ |
| item_name               | string  | null: false                    |
| price                   | integer | null: false                    |
| delivery_charge_id      | integer | null: false                    |
| explanation             | text    | null: false                    |
| user                    | string  | null: false, foreign_key: true |
| category_id             | integer | null: false                    |
| quality_id              | integer | null: false                    |
| shipping_origin_area_id | integer | null: false                    |
| delivery_date_id        | integer | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one : item
- has_one : recipient

## recipients テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_cord          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     | ------------------------------ |
| telephone_number   | integer    | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association
- has_one :purchase

