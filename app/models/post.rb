class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :image
  has_one_attached :video

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Post.where('title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end
  validates :body, presence: true, length: {maximum: 255}
  validates :title, presence: true, length: {maximum: 30}

end
