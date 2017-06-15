class ShortenedUrl < ActiveRecord::Base
  validate :no_spamming

  def no_spamming
    spam =
    submitter.submitted_urls.where({created_at: Time.now - 1.minute..Time.now }).count > 5

    self.errors[:user_id] << "No spamming!" if spam
  end

  def self.prune(n)
    all.each do |url|
      url.visits.each do |visit|
        url.destroy unless visit.created_at.between?(Time.now - n.minutes,Time.now)
      end
    end
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors, -> {distinct},
    through: :visits,
    source: :user

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging

  has_many :tag_topics,
    through: :taggings,
    source: :topic

  def self.random_code
    while true
      new_short = SecureRandom.urlsafe_base64
      break unless self.exists?(short_url: new_short)
    end
    new_short
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short = ShortenedUrl.random_code
    ShortenedUrl.create!(long_url: long_url, short_url: short, user_id: user.id)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where( {created_at: (Time.now - 1.day)..Time.now} ).count
  end
end
