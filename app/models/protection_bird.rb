class ProtectionBird < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :breed, optional: true
  has_many :protection_bird_comments, dependent: :destroy
  has_many :protection_checks, dependent: :destroy

  attachment :image

  validates :flag, inclusion:{in: [true, false]}
  with_options presence: true do
    validates :bird_introduction, length: {maximum: 100}
    validates :protect_place, length: {maximum: 30}
    validates :feature, length: {maximum: 100}
    validates :protect_introduction, length: {maximum: 100}
    validates :color, length: {maximum: 30}
    validates :image
    validates :protect_day
    validates :sex
    validates :breed_id
    validates :prefecture_code
    validates :title, length: {maximum: 30}

  end

  enum sex: { オス: 0, メス: 1, 不明:2}

  def checked_by?(user)
    protection_checks.where(user_id: user.id).exists?
  end

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
