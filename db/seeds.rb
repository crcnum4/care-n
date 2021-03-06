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
Food.destroy_all

15.times do
    print("creating user")
    user = User.new
    user.email = Faker::Internet.email
    user.password = "fakeuser"
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.save!
end

@jose = User.new(first_name: "Jose", last_name: "Roberts", email: "jroberts@example.com")
@jose.password = "roberts"
@jose.save!

@users = User.all
@users.each do |user|
    count = 0
    (0..35).to_a.each do |day|
        count = count + 1
        print("creating day: #{count} for user: #{user.id}")
        date = day.days.ago
        @entry = Fitbit.new
        @entry.actiondate = date
        @entry.user_id = user.id
        @entry.activity = "steps"
        @entry.profile = ""
        @entry.heartrate = Faker::Number.between(96, 110)
        @entry.steps = Faker::Number.between(4000, 14000)
        @entry.save!
        
        @sleep = Sleep.new
        @sleep.actiondate = date
        @sleep.user_id = user.id
        @sleep.hours = Faker::Number.between(6, 9)
        @sleep.save!
        
        @breakfast = Food.new(mealtype: "breakfast")
        @breakfast.actiondate = date
        @breakfast.user_id = user.id
        @breakfast.calories = Faker::Number.between(250, 800)
        @breakfast.save!
        
        @lunch = Food.new(mealtype: "lunch")
        @lunch.actiondate = date
        @lunch.user_id = user.id
        @lunch.calories = Faker::Number.between(300, 1100)
        @lunch.save!
        
        @dinner = Food.new(mealtype: "dinner")
        @dinner.actiondate = date
        @dinner.user_id = user.id
        @dinner.calories = Faker::Number.between(600, 1500)
        @dinner.save!
        
        if (1..4).to_a.sample == 4
            @snack = Food.new(mealtype: "snack")
            @snack.actiondate = date
            @snack.user_id = user.id
            @snack.calories = Faker::Number.between(0, 400)
            @snack.save!
        end
    end
end
