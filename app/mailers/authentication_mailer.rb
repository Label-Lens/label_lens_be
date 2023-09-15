class AuthenticationMailer < ApplicationMailer
  def send_login_email 
    @user = params[:user]
    @sgid = @user.to_sgid(expires_in: 10.minutes, for: 'login')
    mail(
      to: @user.email,
      subject: "The most magical login link for #{@user.email}"
    )
  end
end