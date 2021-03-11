class CreateBirdChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :bird_checks do |t|
      t.integer :user_id
      t.integer :bird_id

      t.timestamps
    end
  end
end
