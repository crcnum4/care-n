class AddUserIdToFitbit < ActiveRecord::Migration
  def change
    add_column :fitbits, :user_id, :integer
  end
end
