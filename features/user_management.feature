Feature: User management

  Scenario: Login with invalid credentials
    Given i am in the login page
    When i login with username "test04" and password "test1234"
    Then i see the error text "Your account information does not match our records for this user. please try again."

  @wip @defect
  Scenario: Account activation after confirmation token expires
    Given the user "test01" exists but yet to be activated
    And the user "test01" navigates to password reset page using the "Confirmation instructions" mail
    Given the confirmation mail for user "test01" was sent 1 days ago
    And i am taken to the set password page
    When i set password for username "test01" with password "test@1234" and confirm password "test@1234"
    Then i see the error text "Token expired"

  Scenario: On account activation, password strength validation
    Given the user "test02" exists but yet to be activated
    And the user "test02" navigates to password reset page using the "Confirmation instructions" mail
    Given i am taken to the set password page
    When i set password for username "test02" with password "test1234" and confirm password "test@1234"
    Then i see the error text "Your new password does not meet our security requirements, please create a new password."

  Scenario: On account activation, password entries match validation
    Given the user "test03" exists but yet to be activated
    And the user "test03" navigates to password reset page using the "Confirmation instructions" mail
    Given i am taken to the set password page
    When i set password for username "test03" with password "test@1234" and confirm password "test1234"
    Then i see the error text "Your password entries don't match, please confirm your new password again."

  Scenario: Normal user do not have access to create new user
    Given the user "test04" exists but yet to be activated
    And the user "test04" navigates to password reset page using the "Confirmation instructions" mail
    Given i make the admin "test04" as normal user
    And i am taken to the set password page
    When i set password for username "test04" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "test04"
    Then i do not have an option to create new user

  Scenario: User forgets password and goes for Password reset with user name
    Given the user "test05" exists but yet to be activated
    And the user "test05" navigates to password reset page using the "Confirmation instructions" mail
    Given i make the admin "test05" as normal user
    And i am taken to the set password page
    And i set password for username "test05" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "test05"
    When i logout
    And i click on "Forgot password"
    And i see the password reset page with text "Please enter your User ID and click submit to reset your password."
    And i specify username as "test04" and submit
    And i see the message "Thank you for requesting a password reset. You will receive an email shortly to the address we have on file for your account with instructions on how to reset your password. Please follow the link in this email to complete the reset process. Please note that the link in this email will only be valid for 24 hours. Thank you."
    And the user "test05" navigates to password reset page using the "Reset password instructions" mail
    And i am taken to the reset password page
    When i reset password with password "Test1234" and confirm password "Test1234"
    And i am taken to the home page for "test05"

  @wip
  Scenario: On password reset, password strength validation

  @wip
  Scenario: On password reset, password entries match validation
    "Your password entries don't match, please confirm your new password again."

  @wip
  Scenario: On password reset, password strength validation

  @wip
  Scenario: Password reset after token expires

  @wip
  Scenario: User forgets his username and goes for Forgot username with email id. Only appropriate admin gets the notification.
    "We have processed your request to reset your User ID. An Email has been sent to the TripAdvisor Partners Portal administrator for your account. Please contact this administrator for your User ID. Thank you."

  @wip
  Scenario: Login without account activation

  @wip
  Scenario: Lock account with 5 tries, 6th time valid should not be allowed, post 10 mins, 2 scenario
    "You have entered an incorrect User ID or password five times and are now locked out of this account. Please try again later. Alternatively, if you have forgotten your password, request a password reset."
    "You have one more attempt before your account will be locked."



