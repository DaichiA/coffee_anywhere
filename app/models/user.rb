class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :shops, through: :favorites  # fav一覧でshopsを取り出せるように
  has_many :authentications, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  accepts_nested_attributes_for :authentications
  authenticates_with_sorcery!
  has_one_attached :image
  validates :name, presence: true, length: { maximum: 30 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: 'はjpg, gif, png形式のみ利用できます。' },
                      size:         { less_than: 5.megabytes,
                                      message: 'に5MB以上のファイルは利用できません。' }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 8 }
  validates :password_confirmation, presence: true

  # selfの省略
  def fav(shop)
    shops << shop
  end

  def unfav(shop)
    favorites.find_by(shop_id: shop.id).destroy
  end

  def fav?(shop)
    shops.include?(shop)
  end
end
