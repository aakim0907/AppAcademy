class AddUserColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, null: false, default: ''
    # change_column_null :users, :username, false

    add_index :users, :username, unique: true
  end
end
