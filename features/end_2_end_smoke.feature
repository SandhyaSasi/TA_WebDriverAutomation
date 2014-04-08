Feature: End to end smoke test

  Scenario: Smoke test
    Given the user "ashwin" exists but yet to be activated
    And i goto inbox for user "ashwin"
    And i view the "Confirmation instructions" mail
    And i click on Confirm my account
    When i am taken to the set password page
    And i set password for username "ashwin" with password "test@1234" and confirm password "test@1234"
    And i am taken to the home page for "ashwin"
    And i create a new user with following details
      | first_name | last_name | user_name | user_email          |
      | balaji     | g         | blaj      | blaj@mailinator.com |
    Then i see the message "User successfully created!"
    And i activate the user "blaj" with password "test@1234"
    Then i am taken to the home page for "blaj"
    Then i do not have an option to create new user