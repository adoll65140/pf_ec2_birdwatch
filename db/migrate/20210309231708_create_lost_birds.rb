class CreateLostBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :lost_birds do |t|
    
    t.string "lost_bird_name"
    t.text "lost_bird_introduction"
    t.string "bird_image_id"
    t.date "lost_day"
    t.integer "lost_bird_age"
    t.integer "user_id"
    t.string "lost_place"
    t.text "feature"
    t.text "lost_introduction"
    t.boolean "flag", default: true
    t.integer "breed_id"
    t.string "title"
    t.string "color"
    t.integer "prefecture_code"
    t.integer "sex"

    t.timestamps
    end
  end
end
