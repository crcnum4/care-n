class FoodsController < ApplicationController
   def test
      print("TEST SUCCESS: " + params.inspect)
   end
end