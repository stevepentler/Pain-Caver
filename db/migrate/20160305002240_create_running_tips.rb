class CreateRunningTips < ActiveRecord::Migration
  def change
    create_table :running_tips do |t|
      t.string :tip

      t.timestamps null: false
    end
  end
end
