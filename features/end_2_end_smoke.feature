Feature: End to end smoke test

  Scenario: Smoke test
    Given i make user "test03" as admin
    And i am in the mailinator login page
    And i goto inbox for user "test03"
    And i view the "Confirmation instructions" mail
    And i click on Confirm my account
    When i am taken to the reset password page
    And i reset password for username "test03" with password "test@1234"
    Then i am taken to the home page for "test03"