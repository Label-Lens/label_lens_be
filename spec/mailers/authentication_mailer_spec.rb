require 'rails_helper'

RSpec.describe AuthenticationMailer, type: :mailer do 
  it 'should send an email with magic link' do 
    fake_uuid = '1234-5678-9101'
    allow(SecureRandom).to receive(:uuid) { fake_uuid }
    
    user = User.create!(
      email: "doot@doot.com"
    )

    email = AuthenticationMailer.with(user: user).send_login_email

    assert_emails 1 do 
      email.deliver_now
    end

    assert_equal ["no-reply@labellens.com"], email.from 
    assert_equal ['doot@doot.com'], email.to
    assert_equal "The most magical login link for #{user.email}", email.subject

    plaintext_body = email.text_part.body.to_s
    html_body = email.html_part.body.to_s
    # require 'pry'; binding.pry
    expect(plaintext_body).to have_content("Hey there, doot@doot.com!")
    expect(plaintext_body).to have_content("Label Lens is ready to bring some new tunes to your ears.")
    expect(plaintext_body).to have_content("Please click the following link to log in.")
    expect(plaintext_body).to have_content("http://localhost:3000/auth/1234-5678-9101")

    expect(html_body).to have_content("Hey there, doot@doot.com!")
    # expect(html_body).to include("Label Lens is ready to bring some new tunes to your ears.")
    # expect(html_body).to include("Click here to log in. This link will expire in 10 minutes")
    assert_equal ActionMailer::Base.deliveries.count, 1
  end
end