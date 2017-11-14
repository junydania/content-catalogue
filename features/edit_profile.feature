Feature: As a user or administrator
  In order to change my account details
  I should be able to edit my profile


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | administrator  |


  Scenario: When I do not change my password
    Given I am on the "sign_in" page
    And I fill in field "user_email" with "o.dania@laffhub.com"
    And I fill in field "user_password" with "12345678"
    And I click on "Sign In"
    And I should see "Content Catalogue Dashboard"
    And I click on "Osegbemoh Dania"
    And I click on "My Profile"
    And I click on "Edit Profile"
    And I fill in field "first_name" with "Tobias"
    And I fill in field "last_name" with "David"
    And I click on "Update"
    Then show page
    Then I should see "Account successfully updated"


  Scenario: When I change my password
    Given I am on the "sign_in" page
    And I fill in field "user_email" with "o.dania@laffhub.com"
    And I fill in field "user_password" with "12345678"
    And I click on "Sign In"
    And I should see "Content Catalogue Dashboard"
    And I click on "Osegbemoh Dania"
    And I click on "My Profile"
    And I click on "Edit Profile"
    And I fill in field "first_name" with "Tobias"
    And I fill in field "last_name" with "David"
    And I fill in field "password" with "87654321"
    And I fill in field "password confirmation" with "87654321"
    And I fill in field "current password" with "12345678"
    And I click on "Update"
    Then I should see "Account successfully updated"
