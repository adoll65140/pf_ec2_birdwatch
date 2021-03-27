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

end
