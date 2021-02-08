class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  has_many :notifications, dependent: :destroy
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :content, presence: true, length: { maximum: 100 }
  default_scope -> { order(created_at: :desc) }
end
