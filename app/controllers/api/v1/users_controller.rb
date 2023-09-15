class Api::V1::UsersController < ApplicationController 
  def index
    begin
      user = User.find_or_create_by!(email: params[:email])
      AuthenticationMailer.with(user: user).send_login_email.deliver_now
      render json: UserSerializer.new(user), status: 200
    rescue StandardError => e 
      render json: { error: e.message }, status: 400
    end
  end

  def show 
    user = GlobalID::Locator.locate_signed(params[:id])
    
    
  end
end