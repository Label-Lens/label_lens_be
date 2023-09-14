class SessionsController < ApplicationController 
  logged_out_users_welcome!

  def new 
    @redirect_path = params[:redirect_path]
  end

  def create 
    EmailAuth::EmailsLink.new.email(
      email: params[:email],
      redirect_path: params[:redirect_path]
    )
    flash[:notice] = "Check #{params[:email]} for a login link!"
    redirect_to login_email_path
  end

  def authenticate
    result = EmailAuth::ValidatesLoginAttempt.new.validate(params[:token])
    if result.success?
      reset_session
      session[:user.id] = result.user.id
      flash[:notice] = "Welcome, #{result.user.email}!"
      redirect_to params[:redirect_path]
    else
      flash[:error] = "We weren't able to log you in with that link. Try again?"
      redirect_to new_login_path(redirect_path: params[:redirect_path])
    end
  end
end