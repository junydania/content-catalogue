Feature: As a user or administrator
  In order to access the system
  I should login with a registered email and password


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | Administrator  |

  Scenario:
    Given I am on the landing page
    And I click on "Log In"
    And I fill in field "Email" with "o.dania@laffhub.com"
    And I fill in field "Password" with "12345678"
    And I click on "Log in"
    Then I should see "Content Catalogue Dashboard"
    And I should see "Signed in successfully."

