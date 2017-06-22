class Track < ApplicationRecord
  validates :album_id, :name, :lyrics, :bonus, presence: true
  
  belongs_to :album
end
