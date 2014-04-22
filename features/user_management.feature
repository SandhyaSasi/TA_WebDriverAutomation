Feature: User management

  Scenario: Login with invalid credentials
    Given i am in the login page
    When i login with username "test04" and password "test1234"
    Then i see the error text "Your account information does not match our records for this user. please try again."

  Scenario: Account activation after confirmation token expires
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Given the confirmation mail for user "ashwin.from.ta99" was sent 1 days ago
    And i am taken to the set password page
    When i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
    Then i see the error text "Invalid confirmation token"

  Scenario: On account activation, password strength validation
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Given i am taken to the set password page
    When i set password for username "ashwin.from.ta99" with password "test1234" and confirm password "test1234"
    Then i see the error text "Your new password does not meet our security requirements, please create a new password."

  Scenario: On account activation, password entries do not match validation
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Given i am taken to the set password page
    When i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test1234"
    Then i see the error text "Your password entries don't match, please confirm your new password again."

  Scenario: On account activation, wrong user name given
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Given i am taken to the set password page
    When i set password for username "ashwin.from.98" with password "test@1234" and confirm password "test@1234"
    Then i see the error text "Confirmation error! Either your username doesn't match or your password is already set."

  Scenario: Normal user do not have access to create new user
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Given i make the admin "ashwin.from.ta99" as normal user
    And i am taken to the set password page
    When i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "ashwin.from.ta99"
    Then i do not have an option to create new user

  Scenario: User forgets password and goes for Password reset with user name
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Given i make the admin "ashwin.from.ta99" as normal user
    And i am taken to the set password page
    And i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "ashwin.from.ta99"
    When i logout
    And i click "Forgot password"
    And i see the password reset page with text "Please enter your User ID and click submit to reset your password."
    And i specify username as "ashwin.from.ta99" and submit
    And i see the message "Thank you for requesting a password reset. You will receive an email shortly to the address we have on file for your account with instructions on how to reset your password. Please follow the link in this email to complete the reset process. Please note that the link in this email will only be valid for 24 hours. Thank you."
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    And i am taken to the reset password page
    When i reset password with password "Test1234" and confirm password "Test1234"
    And i am taken to the home page for "ashwin.from.ta99"
  @defect
  Scenario: On password reset, password strength validation
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    And i am taken to the set password page
    And i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "ashwin.from.ta99"
    When i logout
    And i click "Forgot password"
    And i see the password reset page with text "Please enter your User ID and click submit to reset your password."
    And i specify username as "ashwin.from.ta99" and submit
    And i see the message "Thank you for requesting a password reset. You will receive an email shortly to the address we have on file for your account with instructions on how to reset your password. Please follow the link in this email to complete the reset process. Please note that the link in this email will only be valid for 24 hours. Thank you."
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Then i am taken to the reset password page
    When i reset password with password "Test123" and confirm password "Test123"
    Then i see the error text "Your new password does not meet our security requirements, please create a new password."

  Scenario: On password reset, password entries match validation
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Given i make the admin "ashwin.from.ta99" as normal user
    And i am taken to the set password page
    And i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "ashwin.from.ta99"
    When i logout
    And i click "Forgot password"
    And i see the password reset page with text "Please enter your User ID and click submit to reset your password."
    And i specify username as "ashwin.from.ta99" and submit
    And i see the message "Thank you for requesting a password reset. You will receive an email shortly to the address we have on file for your account with instructions on how to reset your password. Please follow the link in this email to complete the reset process. Please note that the link in this email will only be valid for 24 hours. Thank you."
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Then i am taken to the reset password page
    When i reset password with password "Test@123" and confirm password "Test#123"
    Then i see the error text "Your password entries don't match, please confirm your new password again."

  Scenario: Password reset after token expires
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Given i make the admin "ashwin.from.ta99" as normal user
    And i am taken to the set password page
    And i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "ashwin.from.ta99"
    When i logout
    And i click "Forgot password"
    And i see the password reset page with text "Please enter your User ID and click submit to reset your password."
    And i specify username as "ashwin.from.ta99" and submit
    And i see the message "Thank you for requesting a password reset. You will receive an email shortly to the address we have on file for your account with instructions on how to reset your password. Please follow the link in this email to complete the reset process. Please note that the link in this email will only be valid for 24 hours. Thank you."
    And the reset password mail for user "ashwin.from.ta99" was sent 1 days ago
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Then i am taken to the reset password page
    When i reset password with password "Test1234" and confirm password "Test1234"
    Then i see the error text "Invalid reset token"


  Scenario: User forgets his username and goes for Forgot username with email id. Only appropriate admin gets the notification.
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    Given i make the admin "ashwin.from.ta99" as normal user
    And i am taken to the set password page
    And i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "ashwin.from.ta99"
    When i logout
    And i click "Forgot User ID"
    And i see the User ID request page with text " Please enter the email address associated with the User ID you have forgotten."
    And i specify email as "ashwin.from.ta99@gmail.com" and submit
    And i see the message "We have processed your request to reset your User ID. An Email has been sent to the TripAdvisor Partners Portal administrator for your account. Please contact this administrator for your User ID. Thank you."

  Scenario: Login without account activation
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And i am in the login page
    When i login with username "ashwin.from.ta99" and password "test@1234"
    Then i see the error text "Your account information does not match our records for this user. please try again."

  Scenario: Lock account with 5 tries, 6th time valid should not be allowed. Post 10 mins the valid credentials are accepted
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    And i am taken to the set password page
    And i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "ashwin.from.ta99"
    And i logout
    When i try to login with username "ashwin.from.ta99" and password "test1234" for "4" times
    Then i see the error text "You have one more attempt before your account will be locked."
    When i login with username "ashwin.from.ta99" and password "test1234"
    Then i see the error text "You have entered an incorrect User ID or password five times and are now locked out of this account. Please try again later. Alternatively, if you have forgotten your password, request a password reset."
    When i am in the login page
    And i login with username "ashwin.from.ta99" and password "test@1234"
    Then i see the error text "You have entered an incorrect User ID or password five times and are now locked out of this account. Please try again later. Alternatively, if you have forgotten your password, request a password reset."
    When "10" minutes has passed after the account lock for user "ashwin.from.ta99"
    And i am in the login page
    And i login with username "ashwin.from.ta99" and password "test@1234"
    Then i am taken to the home page for "ashwin.from.ta99"

  Scenario: Creation of more than one admin for an account is not allowed
   Given the user "ashwin.from.ta99" exists but yet to be activated
   And the user "ashwin.from.ta99" navigates to password reset page using the email received
   And i am taken to the set password page
   When i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
   Then i am taken to the home page for "ashwin.from.ta99"
   Given the user "san.from.ta99" exists but yet to be activated
   And the user "san.from.ta99" navigates to password reset page using the email received
   And i am taken to the set password page
   When i set password for username "san.from.ta99" with password "test@1234" and confirm password "test@1234"
   Then i am taken to the home page for "san.from.ta99"
   And I have access to My Account link
   Given i am in the login page
   When i login with username "ashwin.from.ta99" and password "test@1234"
   Then i am taken to the home page for "ashwin.from.ta99"
   And I do not have access to My Account link

  Scenario: Creation of a normal user by admin and activation. Creation on another normal user with the same user name should fail.
    Given the user "ashwin.from.ta99" exists but yet to be activated
    And the user "ashwin.from.ta99" navigates to password reset page using the email received
    And i am taken to the set password page
    When i set password for username "ashwin.from.ta99" with password "test@1234" and confirm password "test@1234"
    Then i am taken to the home page for "ashwin.from.ta99"
    When i create a new user with following details
    | first_name | last_name| user_name     | user_email              |
    | san        |  s       | san.from.ta99 |san.from.ta99@gmail.com  |
    And I get the confirmation sent time for user "san.from.ta99"
    Then i see the message "User successfully created!"
    When the user "san.from.ta99" navigates to password reset page using the email received
    And i am taken to the set password page
    When i set password for username "san.from.ta99" with password "test@1234" and confirm password "test@1234"
    Then i am taken to the home page for "san.from.ta99"
    When i logout
    And i am in the login page
    And i login with username "ashwin.from.ta99" and password "test@1234"
    And i create a new user with following details
    | first_name | last_name| user_name     | user_email              |
    | san        |  s       | san.from.ta99 |san.from.ta99@gmail.com  |
    Then i see the error text "Error Creating user!"











