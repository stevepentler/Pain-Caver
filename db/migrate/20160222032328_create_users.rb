class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :token
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :profile_picture
      t.string :city
      t.string :state
      t.string :sex
      t.integer :athlete_type
      t.float :weight
      t.float :shoes
      t.string :follower_count
      t.string :friend_count

      t.timestamps null: false
    end
  end
end
