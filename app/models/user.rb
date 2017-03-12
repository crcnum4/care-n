class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :foods
  has_many :fitbits
  has_many :sleeps
  
  def sleeprank(value)
    sleeps = self.sleeps.first(value)
    totalhours = 0
    sleeps.each do |sleep|
      totalhours += sleep.hours
    end
    sleeprank = 0
    sleeprank = ((totalhours.to_f / value.to_f) / 9.0)
    if sleeprank > 0.93
      sleeprank = 0.93
    end
    return sleeprank
  end
  
  def foodrank(value)
    foods = self.foods.all_food(value)
    caltotal = 0
    foods.each do |food|
      caltotal = caltotal + food.calories
    end
    puts(caltotal)
    caltotal = caltotal / value
    foodrank = 0
    if caltotal > 2200
      foodrank = 2200.0 / caltotal.to_f
    else
      foodrank = caltotal.to_f/2200.0 
    end
    return foodrank
  end
  
  def steprank(value)
    steps = self.fitbits.first(value)
    steptotal = 0
    steps.each do |step|
      steptotal = steptotal + step.steps
    end
    
    steptotal = steptotal.to_f / value.to_f
    steprank = steptotal.to_f / 15000.0
    
    return steprank
  end
  
  def healthrank(value)
    srank = sleeprank(value)
    frank = foodrank(value)
    strank = steprank(value)
    
    healthrank = ((srank + frank + strank) / 3) * 900
    
    return healthrank
    
  end
  
  def hr_oneDay
    return healthrank(1)
  end
  
  def hr_oneWeek
    return healthrank(7)
  end
  
  def hr_oneMonth
    return healthrank(30)
  end
  
end
