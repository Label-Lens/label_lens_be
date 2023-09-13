module EmailAuth
  class FindsOrCreatesUser 
    user = User.find_or_create_by(
      email: email.strip.downcase
    )
    if user.persisted? 

    end
  end
end