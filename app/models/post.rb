class Post < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  
  has_many :search_tags, dependent: :destroy
  has_many :tags, through: :search_tags, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/m_e_others_471.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
