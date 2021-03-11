class CreateProtectionChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :protection_checks do |t|
      t.integer :user_id
      t.integer :protection_bird_id

      t.timestamps
    end
  end
end
