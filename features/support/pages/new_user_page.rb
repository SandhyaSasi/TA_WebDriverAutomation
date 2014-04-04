class NewUserPage < Capypage::Page
  element :first_name, 'input#user_first_name'
  element :last_name, 'input#user_last_name'
  element :user_name, 'input#user_username'
  element :user_email, 'input#user_email'
  element :create_user, 'input#create_user'
end