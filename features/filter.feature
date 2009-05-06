Feature: Filters
  Background:
    Given I have a gnap connection
    And I have the "delicious" publisher

  Scenario: Getting a named filter
    Then I should be able to get the "bazqux" filter

  Scenario: Creating a filter
    Then I should be able to create filter "foobar"

  Scenario: Postback url
    Then I should be able to create filter "foobar" with a postback rule

  Scenario Outline: Adding rules
    Then I should be able to create filter "foobar"
    And add an "<type>" rule with a value of "<value>"
    Examples:
      | type    | value    |
      | actor   | steve    |
      | tag     | election |
