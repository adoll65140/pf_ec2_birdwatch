class Post < ApplicationRecord
  belongs_to :user
  
  attachment :image 
  has_one_attached :video
end
