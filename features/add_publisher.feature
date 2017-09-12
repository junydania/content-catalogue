Feature: As a user or administrator
  In order to link a video to a publisher
  I should login to the dashboard to add publisher to the system


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | Administrator  |

  Scenario:
    Given I am on the "sign_in" page
    And I fill in field "user_email" with "o.dania@laffhub.com"
    And I fill in field "user_password" with "12345678"
    And I click on "Sign In"
    And I should see "Content Catalogue Dashboard"
    And I click on "Add Publisher"
    And I fill in field "Publisher Name" with "AY Comedian"
    And I click on "Submit"
    Then I should see "Publisher successfully added"



