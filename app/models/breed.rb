class Breed < ApplicationRecord
  has_many :birds
  has_many :lost_birds
  has_many :protection_birds
  has_many :adoptions
  
  validates :name, presence: true, uniqueness: true
end
