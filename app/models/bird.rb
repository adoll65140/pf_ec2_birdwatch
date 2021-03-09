class Bird < ApplicationRecord
  belongs_to :user
  
  attachment :bird_icon
  attachment :bird_back_image
end
