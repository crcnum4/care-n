class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :foods
  has_many :fitbits
  has_many :sleeps
  
  def sleeprank(days)
    sleeps = self.sleeps.first(days)
    totalhours = 0
    sleeps.each do |sleep|
      totalhours += sleep.hours
    end
      
    sleepbase = self.sleeps.last(30)
    sleep_base_total = 0
    sleepbase.each do |sleep|
      sleep_base_total += sleep.hours
    end
    sleeprank = 0
    sleeprank = ((totalhours / days) / 9)
    if sleeprank > 0.93
      sleeprank = 0.93
    end
    return sleeprank
  end
  
  def healthrank(days)
    
  end
  
  
end
