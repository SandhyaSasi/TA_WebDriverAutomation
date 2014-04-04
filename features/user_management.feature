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

  Scenario: Security requirements validation for password
    Given the user "test99" exists but yet to be activated
    And i goto inbox for user "test99"
    And i view the "Confirmation instructions" mail
    And i click on Confirm my account
    When i am taken to the reset password page
    And i reset password for username "test99" with password "test1234"
    Then i see the error text "Your new password does not meet our security requirements, please create a new password."