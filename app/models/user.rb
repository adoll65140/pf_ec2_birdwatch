class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :birds, dependent: :destroy
  has_many :lost_birds, dependent: :destroy
  has_many :protection_birds, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :bird_comments, dependent: :destroy
  has_many :lost_bird_comments, dependent: :destroy
  has_many :protection_bird_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bird_checks, dependent: :destroy
  has_many :protection_checks, dependent: :destroy
  has_many :lost_checks, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :adoptions, dependent: :destroy
  has_many :messages
  has_many :entries
  has_many :rooms, through: :entries

  attachment :icon
  attachment :back_image

  with_options presence: true do #空白禁止
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :postal_code
    validates :address
    validates :telephone_number
    validates :nickname
  end
  validates :email, uniqueness: true #重複禁止
  validates :first_name_kana, :last_name_kana, #正規表現
      format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。"}
  validates :postal_code, format: { with: /\A\d{7}\z/} #正規表現
  validates :telephone_number, format: { with: /\A\d{10,11}\z/} #正規表現
  validates :is_deleted, inclusion:{in: [true, false]} #入力制限


end
