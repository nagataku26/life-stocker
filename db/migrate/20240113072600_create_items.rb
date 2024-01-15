class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :stock_count, null: false
      t.string :stock_place
      t.date :purchase_date
      t.integer :expiration_id, null: false
      t.date :expiration_date
      t.boolean :purchase_plan
      t.string :purchase_plan_count
      t.string :url
      t.text :memo
      t.references :list, null: false, foreign_key: true
      t.timestamps
    end
  end
end
