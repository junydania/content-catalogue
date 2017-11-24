Feature: As a user or administrator
  In order to prevent users from manually manipulating IDs in the URL query field
  I should be able to mask records with name rather IDs


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | administrator  |

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
      | Stand Up Comedy |
      | Arewa           |
      | Sitcom          |
      | Just for Laughs |

  Scenario:
    Given I am on the "sign_in" page
    And I fill in field "user_email" with "o.dania@laffhub.com"
    And I fill in field "user_password" with "12345678"
    And I click on "Sign In"
    And I should see "Content Catalogue Dashboard"
    And I click on "Add Video"
    And I fill in field "Title" with "BasketMouth yabbed Alibaba"
    And I fill in field "Description" with "Halirious stuff by basketmouth yabbing Alibaba and his family"
    When I fill in "Release Date" date field with "2017, Aug, 29"
    And I fill in field "Video Storage Location" with "ftp://s3.aws.com"
    And I select "AY Live" from "Publisher"
    And I select "Akpororo" from "Comedian"
    And I select "Stand Up Comedy" from "Category"
    And I attach file "AYLive.jpg" in the image field
    And I click on "Submit"
    And I click on "View Videos"
    And I should see "BasketMouth yabbed Alibaba"
    And I click on "Show"
    Then I should see "BasketMouth yabbed Alibaba"


