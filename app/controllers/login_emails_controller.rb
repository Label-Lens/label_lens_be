class LoginEmailsController < ApplicationController 
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
end