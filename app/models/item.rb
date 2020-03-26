class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  has_many :item_images, dependent: :destroy

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :commodity_condition
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :sizes
  accepts_nested_attributes_for :item_images, allow_destroy: true
end
