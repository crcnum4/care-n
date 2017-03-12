class ChageActiondateDatatype < ActiveRecord::Migration
  def change
    remove_column :foods, :actiondate
    remove_column :sleeps, :actiondate
    remove_column :fitbits, :actiondate
    add_column :foods, :actiondate, :datetime
    add_column :sleeps, :actiondate, :datetime
    add_column :fitbits, :actiondate, :datetime
  end
end
