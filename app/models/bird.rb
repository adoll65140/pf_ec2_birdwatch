class Bird < ApplicationRecord
  belongs_to :user

  attachment :bird_icon
  attachment :bird_back_image

  with_options presence: true do #空白禁止
    validates :bird_name
    validates :breed
    validates :bird_introduction
    validates :bird_age
  end
end
