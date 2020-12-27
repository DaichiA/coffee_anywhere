class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :shop_id, presence: true
  validates :shop_id, uniqueness: { scope: :user_id }
end
