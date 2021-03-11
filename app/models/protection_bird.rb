class ProtectionBird < ApplicationRecord
  belongs_to :user
  has_many :protection_bird_comments, dependent: :destroy
  has_many :protection_checks, dependent: :destroy

  attachment :image

  validates :flag, inclusion:{in: [true, false]}
  with_options presence: true do
    validates :bird_introduction
    validates :breed
    validates :protect_place
    validates :feature
    validates :protect_introduction
  end
  
  def checked_by?(user)
    protection_checks.where(user_id: user.id).exists?
  end
end
