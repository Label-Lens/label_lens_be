class AuthenticationMailer < ApplicationMailer
  def send_login_email 
    @user = params[:user]
    @uuid = SecureRandom.uuid
    time = DateTime.now
    @user.update(login_uuid: @uuid, login_timestamp: time + 10.minutes)
    mail(
      to: @user.email,
      subject: "The most magical login link for #{@user.email}"
    )
  end
end