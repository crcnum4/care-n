class FoodsController < ApplicationController
   def test
      print("TEST SUCCESS: " + params.inspect)
      food = params[:Food]
      cal = (50..200).to_a.sample
      if food == "pear"
         cal = "102"
      elsif food == "banana"
         cal = "105"
      elsif food == "apple"
         cal = "94"
      elsif food == "egg"
         cal = "78"
      end
      prefix = "a"
      if food[0] == "a" || food[0] == "e" || food[0] == "i" || food[0] == "o" || food[0] == "u" 
         prefix = "an"
      end
      @json = {:message => "I have recorded that you ate #{prefix} #{food} worth #{cal} calories."}
      render json: @json
   end
end