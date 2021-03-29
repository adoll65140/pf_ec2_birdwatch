class CreateProtectionBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :protection_birds do |t|
      
    t.string "color"
    t.text "bird_introduction"
    t.string "image_id"
    t.date "protect_day"
    t.integer "sex"
    t.integer "user_id"
    t.string "protect_place"
    t.text "feature"
    t.text "protect_introduction"
    t.boolean "flag", default: true
    t.integer "breed_id"
    t.integer "prefecture_code"
    t.string "title"

      t.timestamps
    end
  end
end
