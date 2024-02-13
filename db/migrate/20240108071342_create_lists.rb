class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :list_name, null: false
      t.string :shared_id
      t.string :shared_password
      t.timestamps
    end
  end
end
