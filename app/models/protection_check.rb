class ProtectionCheck < ApplicationRecord
  belongs_to :user
  belongs_to :protection_bird
  
  validates_uniqueness_of :protection_bird_id, scope: :user_id #いいね１つ
end
