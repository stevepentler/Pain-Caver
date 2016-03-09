class CreateUserStatistics < ActiveRecord::Migration
  def change
    create_table :user_statistics do |t|
      t.references :user, index: true, foreign_key: true
      t.float :ytd_mileage
      t.integer :ytd_sessions
      t.string :ytd_duration
      t.integer :ytd_elevation
      t.float :recent_mileage
      t.integer :recent_sessions
      t.string :recent_duration
      t.integer :recent_elevation

      t.timestamps null: false
    end
  end
end
