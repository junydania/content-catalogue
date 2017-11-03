Feature: As a user or administrator
  In order to change my password or name
  I should see my profile page with my credentials


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | administrator  |



  Scenario:
    Given I am on the "sign_in" page
    And I fill in field "user_email" with "o.dania@laffhub.com"
    And I fill in field "user_password" with "12345678"
    And I click on "Sign In"
    And I should see "Content Catalogue Dashboard"
    And I click on "Osegbemoh Dania"
    And I click on "My Profile"
    Then I should see "o.dania@laffhub.com"



