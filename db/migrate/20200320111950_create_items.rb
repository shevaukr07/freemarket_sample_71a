class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduce, null: false
      t.integer :brand_id
      t.integer :size_id
      t.integer :commodity_condition_id
      t.integer :shipping_charge_id
      t.integer :shipping_method_id
      t.integer :prefecture_id
      t.integer :shipping_day_id
      t.integer :purchase_id
      t.references :seller
      t.references :buyer

      t.timestamps
    end
    add_foreign_key :items, :users, column: :seller_id
    add_foreign_key :items, :users, column: :buyer_id
  end
end
