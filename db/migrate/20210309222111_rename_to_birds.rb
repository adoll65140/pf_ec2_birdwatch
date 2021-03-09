class RenameToBirds < ActiveRecord::Migration[5.2]
  def change
    rename_column :birds, :bird_back_image, :bird_back_image_id
    rename_column :birds, :bird_icon, :bird_icon_id
  end
end
