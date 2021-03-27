class ChangeColumnProtect < ActiveRecord::Migration[5.2]
  def change
    rename_column :protection_birds, :bird_name, :color
    rename_column :protection_birds, :bird_age, :sex
    add_column :protection_birds, :prefecture_code, :integer
    add_column :protection_birds, :title, :string
    add_column :lost_birds, :title, :string
    add_column :lost_birds, :color, :string
    add_column :lost_birds, :prefecture_code, :integer
    add_column :lost_birds, :sex, :integer
    add_column :birds, :sex, :integer
  end
end
