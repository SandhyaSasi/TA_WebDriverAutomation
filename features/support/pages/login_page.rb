class LoginPage < Capypage::Page
  set_url 'http://localhost:3000/users/sign_in'

  element :username, 'input#user_username'
  element :password, 'input#user_password'
  element :confirm_password, 'input#user_password_confirmation'
  element :next, 'input#next'
  element :submit, 'input#submit'
end