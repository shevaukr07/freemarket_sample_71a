class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true

  has_one :address
  has_one :card
  has_many :buyer_transactions, class_name: 'Transaction', :foreign_key => 'buyer_id'
  has_many :seller_transactions, class_name: 'Transaction', :foreign_key => 'seller_id'
end
