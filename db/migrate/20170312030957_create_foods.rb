class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :user_id
      t.integer :calories
      t.string :mealtype

      t.timestamps null: false
    end
  end
end
