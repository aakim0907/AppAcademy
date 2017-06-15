class TagTopic < ApplicationRecord
  has_many :tagtopics,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :urls,
    through: :tagtopics,
    source: :url

  def popular_links
    url_link = urls.sort_by { |url| -url.num_clicks }.take(5)
    url_link.map { |url| [url, url.num_clicks] }
  end
end
