class Tag < ApplicationRecord
  has_many :shop_tag_relations, foreign_key: :tag_id, dependent: :destroy
  has_many :shops, through: :shop_tag_relations
end
