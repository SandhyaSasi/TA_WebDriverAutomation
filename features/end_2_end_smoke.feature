Feature: End to end smoke test

  Scenario: Smoke test
    Given i make user "test04" as admin
    And i goto inbox for user "test04"
    And i view the "Confirmation instructions" mail
    And i click on Confirm my account
    When i am taken to the reset password page
    And i reset password for username "test04" with password "test@1234"
    Then i am taken to the home page for "test04"
    And i create a new user with following details
      | first_name | last_name | user_name | user_email          |
      | balaji     | g         | blaj      | blaj@mailinator.com |
    And i see the message "User successfully created!"
    And i activate the user "blaj" with password "test@1234"
    Then i am taken to the home page for "blaj"