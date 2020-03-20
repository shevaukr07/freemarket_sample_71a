
class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :card_company, null: false
      t.string :card_number, null: false
      t.integer :card_year, null: false
      t.integer :card_month, null: false
      t.integer :card_pass, null: false
      t.timestamps
    end
  end
end
