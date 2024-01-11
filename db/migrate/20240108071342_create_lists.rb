class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :selected_icon
      t.string :list_name, null: false
      t.string :list_password, null: false
      t.timestamps
    end
  end
end
