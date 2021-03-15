class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :birds, :breed_id, :integer
    add_column :lost_birds, :breed_id, :integer
    add_column :protection_birds, :breed_id, :integer
    remove_column :birds, :breed, :string
    remove_column :lost_birds, :lost_bird_breed, :string
    remove_column :protection_birds, :breed, :string
  end
end
