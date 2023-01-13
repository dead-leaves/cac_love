class Tag < ApplicationRecord
  
  has_many :search_tags, dependent: :destroy
  has_many :posts, through: :search_tags, dependent: :destroy
end
