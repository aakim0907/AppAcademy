class ChangeDataTypeQuestion < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :text, :text
  end
end
