Feature: As a user or administrator
  In order to store videos in the catalogue
  I should login to the dashboard to add a new video to the system


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | Administrator  |

    And the following publishers exist
      | publisher_name  |
      | AY Live         |
      | BasketMouth     |
      | MC Abbey        |
      | Mr Patrick      |
      | Arewa           |

    And the following comedians exist
      | name            |
      | Akpororo        |
      | Whalemouth      |
      | Gordons         |
      | Pencil          |
      | Ajebo           |

    And the following categories exist
      | category_name   |
      | Stand Up        |
      | Arewa           |
      | Sitcom          |
      | Just for Laughs |

  Scenario:
    Given I am on the landing page
    And I click on "Log In"
    And I fill in field "Email" with "o.dania@laffhub.com"
    And I fill in field "Password" with "12345678"
    And I click on "Log in"
    And I should see "Content Catalogue Dashboard"
    And I click on "Add Video"
    And I fill in field "Title" with "BasketMouth yabbed Alibaba"
    And I fill in field "Description" with "Halirious stuff by basketmouth yabbing Alibaba and his family"
    And I select "September 7, 2017" as the  "Release Date"
    And I fill in field "Storage Path" with "ftp://s3.aws.com"
    And I select "AY Live" from "Publisher"
    And I select "Akpororo" from "Comedian"
    And I select "Stand Up Comedy" from "Category"
    And I click on "Submit"
    Then I should see "Video successfully added"



