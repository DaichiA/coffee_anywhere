class Shop < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :tel, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :address, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 600 }
end
