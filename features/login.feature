Feature: Login

  @wip
  Scenario: Login with valid credentials
    Given the user "test04" exists but yet to be activated
    And i am in the login page
    When i login with username "test04" and password "test@1234"
    Then i am taken to the home page for "test04"

  Scenario: Login with invalid credentials
    Given i am in the login page
    When i login with username "test01" and password "test1234"
    Then i see the error text "Your account information does not match our records for this user. please try again."