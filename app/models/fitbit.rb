class Fitbit < ActiveRecord::Base
    def change
        create_table :fitbit do |t|
            t.string :profile, null: false, default: ""
            t.string :activity, null: false, default: ""
            t.integer :heartrate, null: false, default: 0
            t.string :nutrition, null: false, default: ""
            t.integer :sleep, null: false, default: 0
            t.integer :weight, null: false, default: 0
        end
    end
end