class ProtectionBirdComment < ApplicationRecord
  belongs_to :user
  belongs_to :protection_bird
  
  validates :comment, presence: true, length: {maximum: 100}
end
