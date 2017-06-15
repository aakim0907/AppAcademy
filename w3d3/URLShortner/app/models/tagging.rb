class Tagging < ApplicationRecord
  belongs_to :topic,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :TagTopic

  belongs_to :url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl
end
