class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  has_many :search_tags, dependent: :destroy
  has_many :tags, through: :search_tags, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  validates :category, acceptance: true


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/m_e_others_471.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  
  def self.search_for(content, method)
    
    if method == 'perfect'
      Post.where(title: content)
      
    elsif method == 'forward'
      Post.where('title LIKE ?', content + '%')
      
    elsif method == 'backward'
      Post.where('title LIKE ?', '%' + content)
      
    else
      Post.where('title LIKE ?', '%' + content + '%')
    end
  end

  
  
end
