class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      
      t.string "bird_name"
      t.string "breed"
      t.text "bird_introduction"
      t.string "bird_icon"
      t.date "bird_birthday"
      t.string "bird_back_image"
      t.integer "bird_age"
      t.integer "user_id"

      t.timestamps
    end
  end
end
