class CreateShortenedUrl < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, unique: true, null: false
      t.string :short_url, unique: true, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :shortened_urls, :long_url
  end
end
