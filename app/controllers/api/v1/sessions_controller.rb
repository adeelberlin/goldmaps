class Api::V1::SessionsController < Api::ApiController

def create
  user = User.where(email: params[:email]).first

  if user && user.valid_password?(params[:password])
    if user.authentication_token?
      render json: user.as_json(only: [:authentication_token, :email]), status: :created
    else
      user.save!
      render json: user.as_json(only: [:authentication_token, :email]), status: :created
    end
  else
    head(:unauthorized)
  end
end

def destroy
end

end
