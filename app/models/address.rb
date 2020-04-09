class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture
  validates :name, :name_kana, :postal_code, :prefecture, :city, :address, presence: true

end
