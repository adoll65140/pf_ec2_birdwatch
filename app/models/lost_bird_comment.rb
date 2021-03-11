class LostBirdComment < ApplicationRecord
  belongs_to :user
  belongs_to :lost_bird
end
