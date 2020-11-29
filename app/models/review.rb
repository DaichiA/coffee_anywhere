class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence:true
  validates :shop_id, presence:true
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 300 }
end
