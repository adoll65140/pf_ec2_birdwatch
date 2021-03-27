# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
      email: "vattirii@gmail.com",
      last_name: "田中",
      first_name: "太郎",
      last_name_kana: "タナカ",
      first_name_kana: "タロウ",
      password: "111111",
      postal_code: "5440841",
      address: "東京都港区台場1-11-1",
      telephone_number: "09012345671",
      nickname: "adoll"
    )

9.times do |n|
    User.create!(
      email: "tanakataro#{n + 1}@gmail.com",
      last_name: "田中#{n + 1}",
      first_name: "太郎#{n + 1}",
      last_name_kana: "タナカ",
      first_name_kana: "タロウ",
      password: "11111#{n + 1}",
      postal_code: "111111#{n + 1}",
      address: "東京都港区台場1-11-#{n + 1}",
      telephone_number: "0901234567#{n + 1}",
      nickname: "タッキー#{n + 1}"
    )
  end
  
  9.times do |n|
    Bird.create!(
      bird_name: "test#{n + 1}",
      bird_introduction: "test test test test test test test test test test test ",
      breed_id: "1",
      user_id: "#{n + 1}",
      bird_age: "#{n + 1}",
      sex: "オス"
    )
  end
  
  9.times do |n|
    Post.create!(
      title: "test#{n + 1}",
      body: "test test test test test test test test test test test ",
      user_id: "#{n + 1}",
      bird_id: "#{n + 1}",
    )
  end
  
  

9.times do |n|
    Adoption.create!(
      title: "test#{n + 1}",
      introduction: "test test test test test test test test test test test ",
      health: "test test test test test test test test test test test ",
      other: "test test test test test test test test test test test ",
      background: "test test test test test test test test test test test ",
      postcode: "11111#{n + 1}",
      prefecture_code: "2#{n + 1}",
      address_city: "#{n + 1}市",
      breed_id: "1",
      user_id: "#{n + 1}",
      age: "#{n + 1}",
      sex: "オス"
    )
  end

Breed.create!(name: "セキセイインコ")
Breed.create!(name: "オカメインコ")
Breed.create!(name: "コザクラインコ")
Breed.create!(name: "その他")

Genre.create!(name: "かご")
Genre.create!(name: "遊び道具")
Genre.create!(name: "便利用品")
Genre.create!(name: "その他")