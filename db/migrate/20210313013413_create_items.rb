class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string "item"
      t.text "introduction"
      t.boolean "flag", default: true
      t.integer "postcode"
      t.integer "prefecture_code"
      t.string "address_city"
      t.string "address_street"
      t.string "address_building"
      t.string "image_id"
      t.integer "genre_id"
      t.integer "user_id"

      t.timestamps
    end
  end
end
