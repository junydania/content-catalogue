Feature: As a user or administrator
  In order to link a video to a category
  I should login to the dashboard to add a category to the system


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
    And I should see "Content Catalogue Dashboard"
    And I click on "Add Category"
    And I fill in field "Category Name" with "Stand Up Comedy"
    And I click on "Submit"
    Then I should see "Category successfully created!"


