class AuthenticationMailer < ApplicationMailer
  def send_login_email 
    @user = params[:user]
    @sgid = @user.to_sgid(expires_in: 10.minutes, for: 'login')
    @user.update!(sgid: @sgid.to_s)
    mail(
      to: @user.email,
      subject: "The most magical login link for #{@user.email}"
    )
  end

  def welcome
    @greeting = "Hi"
    mail to: "Daniel.Gallagher92@gmail.com"
  end
end