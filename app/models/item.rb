class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :size
  belongs_to :commodoty_condition
  belongs_to :brand
  belongs_to :shipping_charge
  belongs_to :shipping_mathod
  belongs_to :shipping_day
  has_many :item_images, dependent: :destroy
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :item_images, allow_destroy: true
end
