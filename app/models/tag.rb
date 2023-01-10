class Tag < ApplicationRecord
  
  has_many :search_tags
  has_many :posts, through: :search_tags
end
