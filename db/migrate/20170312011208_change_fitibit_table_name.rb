class ChangeFitibitTableName < ActiveRecord::Migration
  def change
    rename_table :fitbit_oauth, :fitbit_oauths
  end
end
