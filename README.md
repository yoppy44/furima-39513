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

## items テーブル
| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| item-name            | string | null: false |
| image                | text   | null: false |
| price                | string | null: false |
| delivery-charge      | string | null: false |
| explanation          | text   | null: false |
| seller-name          | string | null: false |
| category             | string | null: false |
| quality              | string | null: false |
| shipping-origin-area | string | null: false |
| delivery-date       | date   | null: false |

