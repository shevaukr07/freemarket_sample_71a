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
|prefecture_id|integer|null: false|
|shippig_day_id|integer|foreign_key: true|
|purchase|integer||
|buyer|integer||


### Association
- belongs_to :user
- belongs_to :category
- belongs_to :size
- belongs_to :commodoty_condition
- belongs_to :brand
- belongs_to :shipping_charge
- belongs_to :shipping_mathod
- belongs_to :shipping_day
- has_many :item_images
- belongs_to_active_hash: prefecture

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|text|string|null: false,unique:true|
|ancestry|string|index: true|

### association
- has_many: items

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|item_id|integer|foreign_key: true|
|image|string|null: false|

### association
- belongs_to: item

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|text|string|null: false|

### association
- has_many: items

## commodity_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|text|string|null: false|

### association
- has_many: items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|text|string|null: false|

### association
- has_many: items

## shipping_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|text|string|null: false|

### association
- has_many: items

## shipping_daysテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|text|string|null: false|

### association
- has_many: items

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|user_id|integer|null: false|

### association
- belongs_to: user

## shipping_mathodsテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|text|string|null: false|

### association
- has_many: items

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|string||
|nickname|string|null: false|
|name|string|null: false|
|mailaddress|string|null: false,unique:true|
|password|string|null: false,unique: true|
|furigana|string|null: false|
|birthday|string|null: false|
|sendaddress|string|null: false|
|sendname|string|null: false|
|postalcode|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|housenumber|string|null: false|

### association
- has_many: items
- has_many: cards
- belongs_to_active_hash: prefecture