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
      nickname: "タッキー"
    )

User.create!(
      email: "a@gmail.com",
      last_name: "田中",
      first_name: "太郎",
      last_name_kana: "タナカ",
      first_name_kana: "タロウ",
      password: "111111",
      postal_code: "5440841",
      address: "東京都港区台場1-11-1",
      telephone_number: "09012345671",
      nickname: "タッキー"
    )

Breed.create!(name: "セキセイインコ")
Breed.create!(name: "オカメインコ")
Breed.create!(name: "コザクラインコ")
Breed.create!(name: "その他")
  
Genre.create!(name: "かご")
Genre.create!(name: "遊び道具")
Genre.create!(name: "便利用品")
Genre.create!(name: "その他")