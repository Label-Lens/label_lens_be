class SessionsController < ApplicationController

  def new 
  end

  def create 
    user = User.find_by(email: params[:email])
    if user 
      session[:user_id] = user.id
      require 'pry'; binding.pry
      redirect_to "http://localhost:5000/spotify_oa"
    else
      flash[:error] = "Your email or password was incorrect."
      redirect_to login_path
    end
  end

  # def magic_link
  #   sgid = params.require(:sgid)
  
  #   user = GlobalID::Locator.locate_signed(sgid, for: 'login')
  
  #   if user.nil? || !user.is_a?(User)
  #     redirect_to root_path
  #   else
  #     sign_in(user)
  #     redirect_to root_path
  #   end
  # end

end
# def new 
#   @redirect_path = params[:redirect_path]
# end

# def create 
#   EmailAuth::EmailsLink.new.email(
#     email: params[:email],
#     redirect_path: params[:redirect_path]
#   )
#   flash[:notice] = "Check #{params[:email]} for a login link!"
#   redirect_to login_email_path
# end

# def authenticate
#   result = EmailAuth::ValidatesLoginAttempt.new.validate(params[:token])
#   if result.success?
#     reset_session
#     session[:user.id] = result.user.id
#     flash[:notice] = "Welcome, #{result.user.email}!"
#     redirect_to params[:redirect_path]
#   else
#     flash[:error] = "We weren't able to log you in with that link. Try again?"
#     redirect_to new_login_path(redirect_path: params[:redirect_path])
#   end
# end