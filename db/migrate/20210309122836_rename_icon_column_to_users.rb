class RenameIconColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :icon, :icon_id
    rename_column :users, :back_image, :back_image_id
  end
end
