class Shop < ApplicationRecord
  has_many :shop_tag_relations, dependent: :destroy
  has_many :tags, through: :shop_tag_relations
  validates :name, presence: true, length: { maximum: 30 }
  has_one_attached :image
  #ハイフンなし,0から始まる10桁か11桁 拾いきれないからゆるめに
  VALID_PHONE_NUMBER_REGEX = /\A0\d{9,10}\z/
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :address, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 600 }



  def save_tag(sent_tags)
      current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
      old_tags = current_tags - sent_tags
      new_tags = sent_tags - current_tags

      old_tags.each do |old_tag|
        self.tags.delete Tag.find_by(tag_name: old_tag)
      end

      new_tags.each do |new_tag|
        new_shop_tag = Tag.find_or_create_by(tag_name: new_tag)
        self.tags << new_shop_tag
      end
    end

end
