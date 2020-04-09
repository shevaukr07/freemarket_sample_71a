class AddNameToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :name, :string
    add_column :addresses, :name_kana, :string
  end
end
