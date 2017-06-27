class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password_digest, null: false, unique: true
      t.string :session_token, null: false, unique: true

      t.timestamps
    end
  end
end
