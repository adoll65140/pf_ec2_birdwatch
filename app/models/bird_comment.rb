class BirdComment < ApplicationRecord
  belongs_to :user
  belongs_to :bird
end
