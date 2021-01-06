class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, limit: 50, null: false
    add_column :users, :description, :text, limit: 1000
  end
end
