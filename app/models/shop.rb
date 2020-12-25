class Shop < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :shop_tag_relations, foreign_key: :shop_id, dependent: :destroy
  has_many :tags, through: :shop_tag_relations
  validates :name, presence: true, length: { maximum: 20 }
  has_one_attached :image
  # ハイフンなし,0から始まる10桁か11桁 拾いきれないからゆるめに、空欄も可
  VALID_PHONE_NUMBER_REGEX = /\A0\d{9,10}\z/

  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }, allow_blank: true
  validates :address, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 600 }
  validates :business_hours, length: { maximum: 30 }
  validates :dayoff, presence: true, length: { maximum: 20 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: 'はjpg, gif, png形式のみ利用できます。' },
                      size:         { less_than: 5.megabytes,
                                      message: 'に5MB以上のファイルは利用できません。' }
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def save_tag(sent_tags)
    current_tags = tags.pluck(:tag_name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old_tag|
      tags.delete Tag.find_by(tag_name: old_tag)
    end

    new_tags.each do |new_tag|
      new_shop_tag = Tag.find_or_create_by(tag_name: new_tag)
      tags << new_shop_tag
    end
  end
end
