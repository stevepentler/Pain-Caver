class CreateUserRaces < ActiveRecord::Migration
  def change
    create_table :user_races do |t|
      t.references :user, index: true, foreign_key: true
      t.string :date
      t.string :title
      t.float :distance
      t.string :target_time
      t.string :location
      t.string :start_time

      t.timestamps null: false
    end
  end
end
