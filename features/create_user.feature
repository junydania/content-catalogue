Feature: As an administrator
  In order to have users add content into the catalogue
  I should be able to create new users in the system


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
    And I click on "Create User"
    And I fill in field "Email" with "adetutu.adigwe@efluxz.com"
    And I fill in field "Password" with "12345678"
    And I fill in field "Password Confirmation" with "12345678"
    And I fill in field "First Name" with "Adetutu"
    And I fill in field "Last Name" with "Adigwe"
    And I select "User" from "Role"
    And I click on "Submit"
    Then I should see "User successfully created"





