class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false, limit: 2000
      t.integer :price, null: false
      t.string :address, null: false, limit: 500

      t.timestamps
    end
  end
end
