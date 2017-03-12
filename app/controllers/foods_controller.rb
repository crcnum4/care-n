class FoodsController < ApplicationController
   def test
      print("TEST SUCCESS: " + params.inspect)
      food = params[:Food]
      @json = {:message => "I have recorded that you ate #{food} worth 128 calories."}
      render json: @json
   end
end