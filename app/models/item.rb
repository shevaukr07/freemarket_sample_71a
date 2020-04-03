class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, :price, :introduce, :category_id, :commodity_condition_id, :shipping_charge_id, :shipping_method_id,:prefecture_id, :shipping_day_id, presence: true
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :category
  has_many :item_images, dependent: :destroy
  has_many :favorites
  has_many :users, through: :favorites
  has_many :comments, dependent: :destroy

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :brand
  belongs_to_active_hash :commodity_condition
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :size
  accepts_nested_attributes_for :item_images, allow_destroy: true

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end


  # def self.search(search)
  #   if search
  #     Item.where('text LIKE(?)', "%#{search}%")
  #   else
  #     Item.all
  #   end
  # end
end
