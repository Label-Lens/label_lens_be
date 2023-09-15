class Api::V1::UsersController < ApplicationController 
  def create 
    begin
      user = User.new(user_params)
      user.save
      render json: UserSerializer.new(user), status: 201
    rescue StandardError => e 
      render json: { error: e.message }, status: 400
    end 
  end

  private 

  def user_params 
    params.permit(:email, :password, :password_confirmation)
  end 
end