class AddStepsToFitbit < ActiveRecord::Migration
  def change
    add_column :fitbits, :steps, :integer
  end
end
