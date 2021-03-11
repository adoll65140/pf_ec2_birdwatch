class CreateLostBirdComments < ActiveRecord::Migration[5.2]
  def change
    create_table :lost_bird_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :lost_bird_id

      t.timestamps
    end
  end
end
