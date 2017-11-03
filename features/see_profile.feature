Feature: As a user or administrator
  In order to change my password or name
  I should see my profile page with my credentials


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | administrator  |



  Scenario:
    Given I visit the landing page
    And I click on "Osegbemoh Dania"
    And I click on "Profile"
    Then I should see "o.dania@laffhub.com"



