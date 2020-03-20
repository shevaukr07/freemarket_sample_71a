class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduce, null: false
      t.references :user, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :size, foreign_key: true
      t.references :commodity_condition, foreign_key: true
      t.references :shipping_charge, foreign_key: true
      t.references :shipping_mathod, foreign_key: true
      t.integer :prefecture_id,  null: false
      t.references :shipping_day, foreign_key: true
      t.integer :purchase
      t.integer :buyer

      t.timestamps
    end
  end
end
