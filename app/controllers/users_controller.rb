
class UsersController < ApplicationController
    before_action :authenticate, only: [:index]

    def index
        logger.debug '=====>'
        if current_user
            if params[:username]
                @user=User.where(username: params[:username])
                if @user==[]
                    render :json=>{"error": "Can not find user"}
                else 
                    render :json=>@user.as_json(only: [:id, :username, :email, :photo_id])
                end
            end
        else 
        render :json=> {"msg": "Login first! "}
        end
    end

    def create
        @user=User.new(user_params)
        # logger.debug user_params 
        if @user.valid?
           @user.save
           render :json=> @user.as_json(except: [:password_digest])
        else
            error_array=[] 
            @user.errors.messages.each{|e| error_array.push(e)}
            render :json=>{"error": error_array}
        end
    end

    private

    def user_params
        params.require(:user).permit(:username,:password,:email,:photo_id)
    end
end
