module EmailAuth 
  class EmailsLink 
    def initialize 
      @finds_or_creates_user = FindsOrCreatesUser.new
      @generates_token = GeneratesToken.new

    end

    def email(email:, redirect_path:) 
      user = @finds_or_creates_user.find_or_create_by_email(email)
    end
  end
end