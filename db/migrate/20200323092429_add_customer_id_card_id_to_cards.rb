class AddCustomerIdCardIdToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :customer_id, :string
    add_column :cards, :card_id, :string
  end
end
