class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def fitbitauth
        
    end
    
    def healthrank
        @user = User.find_by_id(params[:id])
        @sleeps = @user.sleeps
        sleeptotal = 0
        @sleeps.each do |a_sleep|
            sleeptotal += a_sleep.hours
        end
    end
        
end