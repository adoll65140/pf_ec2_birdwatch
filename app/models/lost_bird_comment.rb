class LostBirdComment < ApplicationRecord
  belongs_to :user
  belongs_to :lost_bird
  
  validates :comment, presence: true, length: {maximum: 100}
end
