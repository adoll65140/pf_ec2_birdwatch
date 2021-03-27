class ProtectionBird < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :breed, optional: true
  has_many :protection_bird_comments, dependent: :destroy
  has_many :protection_checks, dependent: :destroy

  attachment :image

  validates :flag, inclusion:{in: [true, false]}
  with_options presence: true do
    validates :bird_introduction
    validates :protect_place
    validates :feature
    validates :protect_introduction
  end
  
  enum sex: { オス: 0, メス: 1, 不明:2}

  def checked_by?(user)
    protection_checks.where(user_id: user.id).exists?
  end
  
end
