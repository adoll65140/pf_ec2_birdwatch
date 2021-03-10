class LostBird < ApplicationRecord
   belongs_to :user
   
   attachment :bird_image
   
   validates :flag, inclusion:{in: [true, false]} 
   with_options presence: true do 
    validates :lost_bird_name
    validates :lost_bird_breed
    validates :lost_bird_introduction
    validates :lost_bird_age
    validates :lost_place
    validates :feature
    validates :lost_introduction
  end
end
