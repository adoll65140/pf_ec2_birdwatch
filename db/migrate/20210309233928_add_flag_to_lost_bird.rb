class AddFlagToLostBird < ActiveRecord::Migration[5.2]
  def change
    add_column :lost_birds, :flag, :boolean, default: true

  end
end
