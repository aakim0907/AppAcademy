class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      
      t.timestamps
    end
  end
end
