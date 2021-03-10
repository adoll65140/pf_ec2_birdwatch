class ProtectionBird < ApplicationRecord
  belongs_to :user
   
  attachment :image
  
  validates :flag, inclusion:{in: [true, false]} 
  with_options presence: true do 
    validates :bird_introduction
    validates :breed
    validates :bird_name
    validates :bird_age
    validates :protect_place
    validates :feature
    validates :protect_introduction
  end
end
