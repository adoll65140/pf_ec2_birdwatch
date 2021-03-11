class CreateBirdComments < ActiveRecord::Migration[5.2]
  def change
    create_table :bird_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :bird_id

      t.timestamps
    end
  end
end
