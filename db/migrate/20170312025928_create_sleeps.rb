class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.integer :user_id
      t.float :hours

      t.timestamps null: false
    end
  end
end
