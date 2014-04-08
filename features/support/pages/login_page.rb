class LoginPage < Capypage::Page
  set_url 'http://localhost:3000/users/sign_in'

  element :username, 'input#user_username'
  element :password, 'input#user_password'
  element :confirm_password, 'input#user_password_confirmation'
  element :next_, 'input#next'
  element :submit, 'input#submit'
  element :forgot_user_id, 'a', :text=>'Forgot User ID?'
  element :forgot_password, 'a', :text=>'Forgot password?'

  def set_password username,password,confirm_password
    self.username.set username
    self.password.set password
    self.confirm_password.set confirm_password
    submit.click
  end

  def reset_password password,confirm_password
    self.password.set password
    self.confirm_password.set confirm_password
    submit.click
  end

  def login username,password
    self.username.set username
    self.password.set password
    next_.click
  end
end