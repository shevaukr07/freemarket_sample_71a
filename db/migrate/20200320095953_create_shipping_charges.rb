class CreateShippingCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_charges do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
