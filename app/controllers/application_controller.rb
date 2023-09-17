# class ApplicationController < ActionController::API

  # helper_method :current_user

  # def current_user
  #   @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # before_action :require_login

  # def require_login
  #   @current_user = User.find_by(id: session[:user_id])
  #   return if @current_user.present?

  #   redirect_to new_login_email_path(
  #     redirect_path: request.original_fullpath
  #   )
  # end

  # def self.logged_out_users_welcome!
  #   skip_before_action :require_login
  # end
# end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :omniauth_request?

  private

  def omniauth_request?
    binding.pry
    request.env['omniauth.strategy'].present?
  end
end
