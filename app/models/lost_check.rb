class LostCheck < ApplicationRecord
  belongs_to :user
  belongs_to :lost_bird
  
  validates_uniqueness_of :lost_bird_id, scope: :user_id #関係１つ
end
