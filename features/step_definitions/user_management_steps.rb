Given(/^i am in the login page$/) do
  login_page.load
  expect(login_page.username).to be_visible
end

When(/^i login with username "([^"]*)" and password "([^"]*)"$/) do | username, password|
  login_page.login(username,password)
end

Then(/^i am taken to the home page for "([^"]*)"$/) do |user|
  expect(home_page.welcome_message).to have_text("Welcome #{user}")
end

Then(/^i see the (?:error text|message) "([^"]*)"$/) do |exp_text|
  expect(login_page).to have_text(exp_text)
end

Given(/^the user "([^"]*)" exists but yet to be activated$/) do |username|
  @response = RestClient.post('http://127.0.0.1:3500/users/internal/admin', {'user' => {'username' => username, 'email' => "#{username}@mailinator.com", 'customer_id' => 18, 'currency' => 'EUR', 'timezone' => 'chennai', 'first_name' => username, 'last_name' => username, 'title' => 'MR', 'phone_number' => '999'}}, {:content_type => :json})
  expect(@response.code).to eq(201)
end

When(/^i goto inbox for user "([^"]*)"$/) do |username|
  open_inbox username
end

Given(/^i make the admin "([^"]*)" as normal user$/) do |username|
  User.find_by(:username => username).update(:is_admin => false)
end

When(/^i view the "([^"]*)" mail$/) do |exp_text|
  mailinator_inbox_page.emails.find_by_text(exp_text).click
  expect(mailinator_inbox_page.confirm_account).to be_visible
end

When(/^i click on Confirm my account$/) do
  mailinator_inbox_page.confirm_account.click
end

Then(/^i am taken to the (reset|set) password page$/) do |condition|
  expect(login_page.username).to be_visible if condition == 'set'
  expect(login_page.username).not_to be_visible if condition == 'reset'
  expect(login_page.confirm_password).to be_visible
  expect(login_page.password).to be_visible
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

def open_inbox username
  MailinatorInboxPage.set_url "http://mailinator.com/inbox.jsp?to=#{username}"
  mailinator_inbox_page.load
  expect(mailinator_inbox_page.inbox_header).to have_text("Inbox for: #{username}")
end

When(/^i activate the user "([^"]*)" with password "([^"]*)"$/) do |username, password|
  open_inbox username
  mailinator_inbox_page.act_on_mail 'Confirmation instructions'
  expect(login_page.confirm_password).to be_visible
  login_page.set_password username, password, password
end

When(/^the confirmation mail for user "([^"]*)" was sent (\d+) days ago$/) do |username, days|
  User.find_by(:username => username).update(:confirmation_sent_at => Time.now-days.to_i.day)
end

When(/^the user "([^"]*)" navigates to password reset page using the "([^"]*)" mail$/) do |username, mail_subject|
  open_inbox username
  mailinator_inbox_page.act_on_mail mail_subject
  expect(login_page.confirm_password).to be_visible
end

When(/^i set password for username "([^"]*)" with password "([^"]*)" and confirm password "([^"]*)"$/) do |username, password, confirm_password|
  login_page.set_password(username,password,confirm_password)
end

When(/^i reset password with password "([^"]*)" and confirm password "([^"]*)"$/) do |password, confirm_password|
  login_page.reset_password(password,confirm_password)
  sleep 5
end

Then(/^i do not have an option to create new user$/) do
  expect(home_page.my_account).not_to be_visible
end

When(/^i click on "([^"]*)"$/) do |link|
  login_page.send(link.downcase.gsub(' ','_')).click
end

When(/^i logout$/) do
  home_page.log_out.click
  expect(login_page.username).to be_visible
end

When(/^i see the password reset page with text "([^"]*)"$/) do |exp_text|
  expect(login_page.username).to be_visible
  expect(login_page).to have_text exp_text
end

When(/^i specify username as "([^"]*)" and submit$/) do |username|
  login_page.username.set username
  login_page.submit.click
end