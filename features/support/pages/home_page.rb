class HomePage < Capypage::Page
  element :welcome_message, '.user-nav li.greeting'
  element :my_account, 'a', :text => 'My Account'
  element :my_team, 'a', :text => 'My Team'
end