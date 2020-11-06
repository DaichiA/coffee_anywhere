class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 8 }
  validates :password_confirmation, presence: true
end