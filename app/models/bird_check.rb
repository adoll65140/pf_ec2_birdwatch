class BirdCheck < ApplicationRecord
  belongs_to :user
  belongs_to :bird
  
  validates_uniqueness_of :bird_id, scope: :user_id #いいね１つ
end
