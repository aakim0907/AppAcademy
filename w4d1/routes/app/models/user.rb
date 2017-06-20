# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  username :string           default(""), not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

    has_many :artwork_views,
      primary_key: :id,
      foreign_key: :viewer_id,
      class_name: :ArtworkShare

    has_many :shared_artworks,
      through: :artwork_views,
      source: :artwork

end
