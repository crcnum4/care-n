class AddDateToSleepFoodFitbit < ActiveRecord::Migration
  def change
    add_column :fitbits, :actiondate, :date
    add_column :foods, :actiondate, :date
    add_column :sleeps, :actiondate, :date
  end
end
