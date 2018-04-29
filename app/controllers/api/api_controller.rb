class Api::ApiController < ActionController::Base
  protected
  def check_token
    user = User.where(email: params[:email]).first
    if user && user.authentication_token == params[:token]
      current_user
    else
      head 401
    end
  end
end
