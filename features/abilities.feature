Feature: As an administrator
  In order to secure my content from unauthorized delete
  I should be able to restrict the abilities of users


  Background:
    Given the following user account exist
      | email                | first_name  | last_name | password | password_confirmation | role           |
      | o.dania@laffhub.com  | Osegbemoh   | Dania     | 12345678 | 12345678              | standard       |

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


  Scenario: I should not be able to delete any video
    Given I am on the "sign_in" page
    And I fill in field "user_email" with "o.dania@laffhub.com"
    And I fill in field "user_password" with "12345678"
    And I click on "Sign In"
    And I click on "View Videos"
    And I should see "Ogogoro Master"
    And I click on "Show"
    And I click on "Delete"
    Then I should see "Access Denied: You are not authorized to carry out this action"





