class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :birds, dependent: :destroy
  has_many :lost_birds, dependent: :destroy
  has_many :protection_birds, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :bird_comments, dependent: :destroy
  has_many :lost_bird_comments, dependent: :destroy
  has_many :protection_bird_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bird_checks, dependent: :destroy
  has_many :protection_checks, dependent: :destroy
  has_many :lost_checks, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :adoptions, dependent: :destroy
  has_many :messages
  has_many :entries
  has_many :rooms, through: :entries
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  attachment :icon
  attachment :back_image

  with_options presence: true do #空白禁止
    validates :telephone_number
    validates :nickname, length: {maximum: 20}
  end
  validates :email, uniqueness: true #重複禁止
  validates :telephone_number, format: { with: /\A\d{10,11}\z/} #正規表現
  validates :is_deleted, inclusion:{in: [true, false]} #入力制限
  validates :introduction, length: {maximum: 100}

  def self.search(search)
    if search
      User.where(['nickname LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

end
