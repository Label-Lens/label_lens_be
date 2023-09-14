require 'rails_helper'

module EmailAuth 
  class DeliversEmail
    def deliver(user:, token:, redirect_path:)
      LoginLinkMailer.with(
        user: user,
        token: token,
        redirect_path: redirect_path
      ).login_link.deliver_now
    end
  end
end

RSpec.describe 'EmailAuth::DeliversEmail' do 

  describe '#deliver' do 
    # let(:dummy_class) do 
    #   Class.new do 
    #     include EmailAuth::DeliversEmail
    #   end
    # end

    # let(:dummy_class_object) { dummy_class.new }
    let(:user) { create(:user) }
    let(:token) { 'abc123' }
    let(:redirect_path) { '/dashboard' }
    let(:email) { double("email") }
    let(:mailer_double) { instance_double(LoginLinkMailer) }

    before do 
      allow(LoginLinkMailer).to receive(:with).and_return(mailer_double)
      allow(mailer_double).to receive(:login_link).and_return(email)
      allow(email).to receive(:deliver_now)
    end

    it 'sends an email with a login link' do 

      expect(mailer_double).to receive(:login_link).and_return(email)
      # allow(LoginLinkMailer).to receive(:with).and_return(mailer_double)
      expect(LoginLinkMailer).to receive(:with).with(
        user: user,
        token: token,
        redirect_path: redirect_path
      ).and_return(mailer_double)
  
      EmailAuth::DeliversEmail.new.deliver(user: user, token: token, redirect_path: redirect_path)
      # expect(mailer_double).to receive(:login_link)
      # expect(mailer_double).to receive(:deliver_now)?
      
      EmailAuth::DeliversEmail.new.deliver(
        user: user,
        token: token,
        redirect_path: redirect_path
      )
    end
  end
end