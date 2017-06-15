class ChangeDataTypeAnswer < ActiveRecord::Migration[5.0]
  def change
    change_column :answer_choices, :text, :text
  end
end
