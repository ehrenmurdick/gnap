Feature: Publisher

  Scenario: Get publisher by name
    Given I have a gnap connection
    Then I should be able to get the publisher "twitter" by name

  Scenario: Fakeweb
    Given I have a gnap connection
    When I get "twitter" notifications
