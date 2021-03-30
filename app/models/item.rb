class Item < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  belongs_to :user
  belongs_to :genre, optional: true
  attachment :image

  with_options presence: true do #空白禁止
    validates :item, length: {maximum: 30}
    validates :introduction, length: {maximum: 100}
    validates :prefecture_code
    validates :address_city, length: {maximum: 30}
    validates :image
    validates :genre_id
  end
end
