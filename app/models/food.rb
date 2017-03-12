class Food < ActiveRecord::Base
    def change
        create table(:food) do |t|
        
            t.string :name, null: false, default: ""
            t.integer :calories, null: false, default: 0
            t.integer :total_fat, null: false, default: 0
            t.timestamps
        end
    end
end
