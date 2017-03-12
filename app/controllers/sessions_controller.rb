class SessionsController < ApplicationController
  
  # def create_user
  #   begin
  #     @auth = Userauth.from_omniauth(request.env['omniauth.auth'])
  #     session[:auth_id] = @auth.id
  #     flash[:success] = "Welcome, #{@auth.name}!"
  #   rescue
  #     flash[:warning] = "There was an error authenticating you..."
  #   end
    
  #   redirect_to 
  # end
  
  # def create_band_auth
  #   begin
  #     @auth = Bandauth.from_omniauth(request.env['omniauth.auth'])
  #     session[:auth_id] = @auth.id
  #     flash[:success] = "You've have autheticated successfully!"
  #   rescue
  #     flash[:warning] = "There was an error authenticating you..."
  #   end
  
  #   redirect_to band_path[@current_user.bands.last.id]
    
  # end
  
    def create
        # render text: request.env['omniauth.auth'].to_yaml
        
        @user = current_user
        if @user
            if params[:code]
               @auth = FitbitOauth.new(user_id: current_user.id, authorization: params[:code])
               @auth.save
               redirect_to "https://"
           end
        end
        render :text => params
    end
end