class RemoveCardCompanyCardNumbercardYearCardMonthFromCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :card_company, :string
    remove_column :cards, :card_number, :string
    remove_column :cards, :card_year, :integer
    remove_column :cards, :card_month, :integer
    remove_column :cards, :card_pass, :integer
  end
end
