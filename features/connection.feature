Feature: Gnap connection
  Scenario: Making requests
    Given I have a gnap connection
    Then I should be able to construct requests
    And I should be able to make post requests
    And I should be able to make get requests
