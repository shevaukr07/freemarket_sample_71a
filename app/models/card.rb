class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_number, :card_company, :card_year, :card_month,:card_pass, presence: true
end
