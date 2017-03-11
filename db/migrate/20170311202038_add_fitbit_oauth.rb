class AddFitbitOauth < ActiveRecord::Migration
  def change
    create_table :fitbit_oauth do |t|
      t.integer :user_id
      t.string :authorization
      t.string :access_token
    end
  end
end
