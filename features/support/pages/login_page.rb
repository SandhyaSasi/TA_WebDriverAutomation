class LoginPage < Capypage::Page
  set_url 'http://localhost:3000/users/sign_in'

  element :username, 'input#user_username'
  element :password, 'input#user_password'
  element :confirm_password, 'input#user_password_confirmation'
  element :next_, 'input#next'
  element :submit, 'input#submit'

  def reset_password username,password
    self.username.set username
    self.password.set password
    confirm_password.set password
    submit.click
  end

  def login username,password
    self.username.set username
    self.password.set password
    next_.click
  end
end