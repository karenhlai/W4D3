class SessionsController < ApplicationController
    def new
        render :new
    end

    #check if user already exists, if found log_in, otherwise redirect
    def create
      # debugger
      @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password]) 
      if @user
        login!(@user) #don't call reset_session_token here, login! will call it
        # redirect_to user_url(@user) 
      else
        render :new
      end
    end

    def destroy
      
    end

end
