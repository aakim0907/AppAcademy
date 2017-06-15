class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  has_many :visited_url,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :visit

  has_many :visited_urls, -> {distinct},
    through: :visited_url,
    source: :shortened_url
end
