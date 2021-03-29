class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      
    t.string "bird_name"
    t.text "bird_introduction"
    t.string "bird_icon_id"
    t.date "bird_birthday"
    t.string "bird_back_image_id"
    t.integer "bird_age"
    t.integer "user_id"
    t.integer "breed_id"
    t.integer "sex"

      t.timestamps
    end
  end
end
