class Food < ActiveRecord::Base
    belongs_to :user
    
    scope :all_food, ->(value) { where("actiondate BETWEEN ? AND ?", value.days.ago.beginning_of_day, 0.days.ago.beginning_of_day) }
end