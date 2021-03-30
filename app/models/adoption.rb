class Adoption < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  belongs_to :user, optional: true
  belongs_to :breed, optional: true
  attachment :image

  enum sex: { オス: 0, メス: 1, 不明:2}

  with_options presence: true do
    validates :title, length: {maximum: 30}
    validates :introduction, length: {maximum: 100}
    validates :health, length: {maximum: 100}
    validates :other, length: {maximum: 100}
    validates :background, length: {maximum: 100}
    validates :address_city, length: {maximum: 30}
    validates :image
    validates :prefecture_code
    validates :age, length: {maximum: 2}
    validates :breed_id
    validates :sex
  end
end
