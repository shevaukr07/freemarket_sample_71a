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

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|
|price|integer|null: false|
|introduce|text|null: false|
|user_id|integer|null: false,foreign_key: true|
|brand_id|integer|foreign_key: true|
|size_id|integer|foreign_key: true|
|commodity_condition_id|integer|foreign_key: true|
|shippig_charge_id|integer|foreign_key: true|
|shippig_method_id|integer|foreign_key: true|
|prefecture_id|integer|foreign_key: true|
|shippig_day_id|integer|foreign_key: true|
|purchase|integer||
|buyer|integer||





### Association
- belongs_to :sizes
- belongs_to :commodoty_condition
- belongs_to :brand
- belongs_to :shipping_charge
- has_many :item_images
- has_many :item_categories