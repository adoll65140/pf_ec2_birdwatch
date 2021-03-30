class LostBird < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :breed, optional: true
  has_many :lost_bird_comments, dependent: :destroy
  has_many :lost_checks, dependent: :destroy

  attachment :bird_image

  validates :flag, inclusion:{in: [true, false]}
  with_options presence: true do
    validates :lost_bird_name, length: {maximum: 10}
    validates :lost_bird_introduction, length: {maximum: 100}
    validates :lost_bird_age, length: {maximum: 2}
    validates :lost_place, length: {maximum: 30}
    validates :feature, length: {maximum: 100}
    validates :lost_introduction, length: {maximum: 100}
    validates :color, length: {maximum: 20}
    validates :prefecture_code
    validates :bird_image
    validates :breed_id
    validates :title, length: {maximum: 30}
    validates :lost_day
    validates :sex
  end
  
  enum sex: { オス: 0, メス: 1, 不明:2}

  def checked_by?(user)
    lost_checks.where(user_id: user.id).exists?
  end
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
