class ApplicationController < ActionController::API
  def current_user
    token=request.headers['Auth-key']
    begin
    user_id =JWT.decode(token,'123')[0]['user_id']
    @user=User.find_by(id: user_id)
    rescue
      nil
    end 
  end
  def authenticate
    # byebug
    unless current_user
      nil
    end
  end
    # logger.debug "============> auth token"
    # logger.debug auth_header
end
