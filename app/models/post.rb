class Post < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  
  has_many :search_tags
  has_many :tags, through: :search_tags
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  
  
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
