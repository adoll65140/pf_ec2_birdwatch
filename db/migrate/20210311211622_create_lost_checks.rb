class CreateLostChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :lost_checks do |t|
      t.integer :user_id
      t.integer :lost_bird_id

      t.timestamps
    end
  end
end
