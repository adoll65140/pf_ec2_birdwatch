class LostBird < ApplicationRecord
  belongs_to :user
  belongs_to :breed, optional: true
  has_many :lost_bird_comments, dependent: :destroy
  has_many :lost_checks, dependent: :destroy

  attachment :bird_image

  validates :flag, inclusion:{in: [true, false]}
  with_options presence: true do
    validates :lost_bird_name
    validates :lost_bird_introduction
    validates :lost_bird_age
    validates :lost_place
    validates :feature
    validates :lost_introduction
  end

  def checked_by?(user)
    lost_checks.where(user_id: user.id).exists?
  end
end
