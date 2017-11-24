Feature: As an administrator
  In order to prevent users from manually manipulating IDs in the URL query field
  I should be able to mask records with name rather IDs


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | standard       |
      | ade@efluxz.com       | Dewunmi     | Adebowale | 12345678 | 12345678              | administrator  |

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

    And the following video exist
      | title                | description                            | publisher_name | comedian_name | category_name   | video_storage_path                           |
      | Ogogoro Master       | Gordons talks about drinking ogogoro   | AY Live        |  Gordons      | Stand Up Comedy | laffhubarchive/LaffHub+Videos/24014-LIES.mp4 |


  Scenario: I should be able to view a video using its friendly URL name
    Given I am on the "sign_in" page
    And I fill in field "user_email" with "o.dania@laffhub.com"
    And I fill in field "user_password" with "12345678"
    And I click on "Sign In"
    And I go to "show video" page of  "ogogoro-master"
    And I should see "Ogogoro Master"

  Scenario: I should be able to view a user using friendly URL name
    Given I am on the "sign_in" page
    And I fill in field "user_email" with "o.dania@laffhub.com"
    And I fill in field "user_password" with "12345678"
    And I click on "Sign In"
    And I go to "show video" page of  "ogogoro-master"
    And I should see "Ogogoro Master"


