class CreateAdoptions < ActiveRecord::Migration[5.2]
  def change
    create_table :adoptions do |t|
      t.string "title"
      t.text "introduction"
      t.text "health"
      t.text "other"
      t.text "background"
      t.boolean "flag", default: true
      t.integer "postcode"
      t.integer "prefecture_code"
      t.string "address_city"
      t.string "address_street"
      t.string "address_building"
      t.string "image_id"
      t.integer "breed_id"
      t.integer "user_id"
      t.integer "age"
      t.integer "sex"

      t.timestamps
    end
  end
end
