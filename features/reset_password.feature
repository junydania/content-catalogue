Feature: As a user or administrator
  In order to change my password
  I should be able to reset my password from the login page


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | Administrator  |

  Scenario: Change password for existing user
    Given I am on the landing page
    And I click on "Log In"
    And I click on "Forgot your password?"
    And I fill in field "Email" with "o.dania@laffhub.com"
    And I click on "Send me reset password instructions"
    And I should receive a "Reset password instructions" email
    When I click on the retrieve password link in the last email
    Then I should see "Change your password"
    And I fill in "New password" with "12345678"
    And I fill in "Confirm new password" with "12345678"
    And I click "Change my password"
    And I should see "Your password has been changed successfully. You are now signed in."

