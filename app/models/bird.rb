class Bird < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :breed, optional: true
  has_many :bird_comments, dependent: :destroy
  has_many :bird_checks, dependent: :destroy

  attachment :bird_icon
  attachment :bird_back_image

  with_options presence: true do #空白禁止
    validates :bird_name, length: {maximum: 20}
    validates :bird_introduction, length: {maximum: 100}
    validates :bird_icon
    validates :bird_age, length: {maximum: 2}
    validates :breed_id
    validates :sex
  end

  def checked_by?(user)
    bird_checks.where(user_id: user.id).exists?
  end
  
  def self.search(search)
    if search
      Bird.where(['bird_name LIKE ?', "%#{search}%"])
    else
      Bird.all
    end
  end
end
