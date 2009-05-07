Feature: Publisher
  Background:
    Given I have a gnap connection

  Scenario: Get publisher by name
    Then I should be able to get the publisher "twitter" by name

  Scenario Outline: Parsing results
    When I get "<provider>" notifications
    Then there should be <n> notifications
    And the number 1 notification <data> should be <value>
    
    Examples:
      |provider   | n | data            | value | 
      | twitter   |210| url             | "http://twitter.com/statuses/show/1706771613.xml" |
      | delicious | 41| regarding_url   | "http://www.vernalex.com/guides/sysprep/index.shtml" |
      | flickr    | 23| destination_url | "http://www.flickr.com/photos/88711294@N00/3508256020/" |
      | youtube   |  7| destination_url | "http://www.youtube.com/watch?v=ULiNR-k4m70" |

