class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduce, null: false
      t.integer :brand
      t.integer :size
      t.integer :commodity_condition
      t.integer :shipping_charge
      t.integer :shipping_method
      t.integer :prefecture
      t.integer :shipping_day
      t.integer :purchase
      t.references :seller
      t.references :buyer

      t.timestamps
    end
    add_foreign_key :items, :users, column: :seller_id
    add_foreign_key :items, :users, column: :buyer_id
  end
end
