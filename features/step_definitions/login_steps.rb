Given(/^i am in the login page$/) do |condition|
  login_page.load
  expect(login_page.username).to be_visible
end

When(/^i (login with|reset password for) username "([^"]*)" (?:and|with) password "([^"]*)"$/) do |action,username, password|
  login_page.username.set username
  login_page.password.set password
  login_page.confirm_password.set password if action == 'reset password for'
  action == 'login with' ? login_page.next.click : login_page.submit.click
end

Then(/^i am taken to the home page for "([^"]*)"$/) do |user|
  expect(home_page.welcome_message).to have_text("Welcome #{user}")
end

Then(/^i see the (?:error) text "([^"]*)"$/) do |exp_text|
  expect(login_page).to have_text(exp_text)
end

Given(/^the user "([^"]*)" with password "([^"]*)" exists$/) do |username, password|
  User.create!(:email=>"#{username}@mailinator.com", :encrypted_password => 'test@1234', :username=>username, :customer_id=>18)
end

Given(/^i am in the mailinator login page$/) do
  mailinator_login_page.load
  expect(mailinator_login_page.inbox_field).to be_visible
end

When(/^i goto inbox for user "([^"]*)"$/) do |username|
  mailinator_login_page.inbox_field.set username
  mailinator_login_page.check_it.click
  expect(mailinator_inbox_page.inbox_header).to have_text("Inbox for: #{username}")
end

Given(/^i make user "([^"]*)" as admin$/) do |username|
  User.find_by(:username => username).update(:is_admin=>true)
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