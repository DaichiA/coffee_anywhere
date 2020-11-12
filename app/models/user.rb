class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one_attached :image
  validates :name, presence: true, length: { maximum: 30 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "はjpg, gif, png形式のみ利用できます。" },
                      size:         { less_than: 5.megabytes,
                                      message: "に5MB以上のファイルは利用できません。" }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 8 }
  validates :password_confirmation, presence: true

end
