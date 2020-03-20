class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :postal_code, null: false, :limit => 7
      t.timestamps
    end
  end
end
