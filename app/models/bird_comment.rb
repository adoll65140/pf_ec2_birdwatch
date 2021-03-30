class BirdComment < ApplicationRecord
  belongs_to :user
  belongs_to :bird
  
  validates :comment, presence: true, length: {maximum: 100}
end
