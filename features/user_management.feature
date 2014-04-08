Feature: User management

  Scenario: Login with invalid credentials
    Given i am in the login page
    When i login with username "test01" and password "test1234"
    Then i see the error text "Your account information does not match our records for this user. please try again."

  @wip @defect
  Scenario: Account activation after confirmation token expires
    Given the user "test97" exists but yet to be activated
    And the confirmation mail for user "test97" was sent 1 days ago
    And i goto inbox for user "test97"
    And i view the "Confirmation instructions" mail
    And i click on Confirm my account
    When i am taken to the reset password page
    And i reset password for username "test97" with password "test@1234"
    Then i see the error text "Token expired"

  Scenario: On account activation, password strength validation
    Given the user "test99" exists but yet to be activated
    And i goto inbox for user "test99"
    And i view the "Confirmation instructions" mail
    And i click on Confirm my account
    When i am taken to the reset password page
    And i reset password for username "test99" with password "test1234"
    Then i see the error text "Your new password does not meet our security requirements, please create a new password."

  @wip
  Scenario: On account activation, password entries match validation

  @wip
  Scenario: Normal user do not have access to create new user

  @wip
  Scenario: User forgets password and goes for Password reset with user name
    "Thank you for requesting a password reset. You will receive an email shortly to the address we have on file for your account with instructions on how to reset your password. Please follow the link in this email to complete the reset process. Please note that the link in this email will only be valid for 24 hours. Thank you."

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



