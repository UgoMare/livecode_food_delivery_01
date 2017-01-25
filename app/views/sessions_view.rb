class SessionsView

  def ask_user_for_username
    p 'What is your username?'
    print '> '
    gets.chomp
  end

  def ask_user_for_password
    p 'What is your password?'
    print '> '
    gets.chomp
  end

  def wrong_credentials
    p "Wrong credentials! Try again!"
  end

  def logged_in
    p 'Welcome!'
  end
end
