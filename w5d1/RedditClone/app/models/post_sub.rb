class PostSub < ApplicationRecord
  validates :sub, presence: true
  validates :post, presence: true, uniqueness: { scope: :sub }

  belongs_to :sub
  belongs_to :post

end
