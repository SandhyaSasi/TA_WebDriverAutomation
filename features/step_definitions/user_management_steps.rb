Given(/^i am in the login page$/) do
  login_page.load
  expect(login_page.username).to be_visible
end

When(/^i (login with|reset password for) username "([^"]*)" (?:and|with) password "([^"]*)"$/) do |action, username, password|
  action == 'login with' ? login_page.login(username,password) : login_page.reset_password(username,password)
end

Then(/^i am taken to the home page for "([^"]*)"$/) do |user|
  expect(home_page.welcome_message).to have_text("Welcome #{user}")
end

Then(/^i see the (?:error text|message) "([^"]*)"$/) do |exp_text|
  expect(login_page).to have_text(exp_text)
end

Given(/^the user "([^"]*)" exists but yet to be activated$/) do |username|
  @response = RestClient.post('http://127.0.0.1:3500/users/internal/admin', {'user' => {'username' => username, 'email' => "#{username}@mailinator.com", 'customer_id' => '18', 'currency' => 'EUR', 'timezone' => 'chennai', 'first_name' => username, 'last_name' => username, 'title' => 'MR', 'phone_number' => '999'}}, {:content_type => :json})
  expect(@response.code).to eq(201)
end

When(/^i goto inbox for user "([^"]*)"$/) do |username|
  open_inbox username
end

Given(/^i make user "([^"]*)" as admin$/) do |username|
  User.find_by(:username => username).update(:is_admin => true)
end

When(/^i view the "([^"]*)" mail$/) do |exp_text|
  mailinator_inbox_page.emails.find_by_text(exp_text).click
  expect(mailinator_inbox_page.confirm_account).to be_visible
end

When(/^i click on Confirm my account$/) do
  mailinator_inbox_page.confirm_account.click
end

Then(/^i am taken to the reset password page$/) do
  expect(login_page.confirm_password).to be_visible
end

When(/^i create a new user with following details$/) do |table|
  user_details = table.hashes.first
  home_page.my_account.click
  home_page.my_team.click
  users_page.add_new_user.click
  user_details.each do |key, value|
    new_user_page.send(key).set value
  end
  new_user_page.create_user.click
end

def activate_user username, password
  open_inbox username
  mailinator_inbox_page.emails.find_by_text('Confirmation instructions').click
  expect(mailinator_inbox_page.confirm_account).to be_visible
  mailinator_inbox_page.confirm_account.click
  expect(login_page.confirm_password).to be_visible
  login_page.reset_password username,password
end

def open_inbox username
  MailinatorInboxPage.set_url "http://mailinator.com/inbox.jsp?to=#{username}"
  mailinator_inbox_page.load
  expect(mailinator_inbox_page.inbox_header).to have_text("Inbox for: #{username}")
end

When(/^i activate the user "([^"]*)" with password "([^"]*)"$/) do |username, password|
  activate_user username,password
end