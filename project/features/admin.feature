Feature: Admin

  Scenario: Login to the admin
    Given I am a staff user
    When I log in to the admin
    Then I should see the admin index page
