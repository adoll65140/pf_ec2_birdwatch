class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  attachment :image 
  has_one_attached :video
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
