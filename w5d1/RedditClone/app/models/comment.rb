class Comment < ApplicationRecord
  validates :content, :author, :post, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :post

  has_many :child_comments,
  foreign_key: :parent_comment_id,
  primary_key: :id,
  class_name: :Comment

  


end
