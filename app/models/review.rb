class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :shop, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence:true
  validates :shop_id, presence:true
  validates :content, presence: true, length: { maximum: 300 }
end
