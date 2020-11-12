class Shop < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  has_one_attached :image
  #ハイフンなし,0から始まる10桁か11桁 拾いきれないからゆるめに
  VALID_PHONE_NUMBER_REGEX = /\A0\d{9,10}\z/
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :address, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 600 }
end
