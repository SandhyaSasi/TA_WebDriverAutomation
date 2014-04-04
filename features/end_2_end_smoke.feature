Feature: End to end smoke test

  Scenario: Smoke test
    Given the user "test99" exists but yet to be activated
    And i make user "test99" as admin
    And i goto inbox for user "test99"
    And i view the "Confirmation instructions" mail
    And i click on Confirm my account
    When i am taken to the reset password page
    And i reset password for username "test99" with password "test@1234"
    And i am taken to the home page for "test99"
    And i create a new user with following details
      | first_name | last_name | user_name | user_email          |
      | balaji     | g         | blaj      | blaj@mailinator.com |
    Then i see the message "User successfully created!"
    And i activate the user "blaj" with password "test@1234"
    Then i am taken to the home page for "blaj"