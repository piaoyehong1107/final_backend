class SessionsController < ApplicationController
    # When user login, create a session and token
    def create 
        @user=User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password]) 
            payload={user_id: @user.id}
            token=JWT.encode(payload,'123','HS256')
            render :json=>{auth_key: token}
        else
            render :json=>{"error"=> "Sorry, username and password do not match"}
        end
    end
end