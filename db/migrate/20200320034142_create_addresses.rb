class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :postal_code, null: false, :limit => 7
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :apartment
      t.integer :phone_num
      t.timestamps
    end
  end
end
