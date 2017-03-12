# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Fitbit.destroy_all
Sleep.destroy_all

15.times do
    user = User.new
    user.email = Faker::Internet.email
    user.password = Faker::Internet.password(8, 15)
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.save!
end

@jose = User.new(first_name: "Jose", last_name: "Roberts", email: "jroberts@example.com")
@jose.password = "roberts"
@jose.save!

@users = User.all
@users.each do |user|
    0..35 do |day|
        date = day.days.ago
        @entry = Fitbit.new
        @entry.created_at = date
        @entry.user_id = user.id
        @entry.activity = "steps"
        @entry.profile = ""
        @entry.heartrate = Faker::Number.between(96, 110)
        @entry.steps = Faker::Number.between(4000, 12000)
        @entry.save!
        
        @sleep = Sleep.new
        @sleep.created_at = date
        @sleep.user_id = user.id
        @sleep.hours = Faker::Number.between(6, 9)
        @sleep.save!
        
        @breakfast = Food.new(mealtype: "breakfast")
        @breakfast.created_at = date
        @breakfast.user_id = user.id
        @breakfast.calories = Faker::Number(350, 1200)
        @breakfast.save!
        
        @lunch = Food.new(mealtype: "lunch")
        @lunch.created_at = date
        @lunch.user_id = user.id
        @lunch.calories = Faker::Number(500, 1500)
        @lunch.save!
        
        @dinner = Food.new(mealtype: "dinner")
        @dinner.created_at = date
        @dinner.user_id = user.id
        @dinner.calories = Faker::Number(900, 2200)
        @dinner.save!
        
        if 1..4.sample == 4
            @snack = Food.new(mealtype: "snack")
            @snack.created_at = date
            @snack.user_id = user.id
            @snack.calories = Faker::Number(50, 400)
            @snack.save!
        end
    end
end
