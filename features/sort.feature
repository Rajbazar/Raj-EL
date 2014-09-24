@EndtoEnd

Feature:Sort Button
  Scenario: Use all the options available for Sort button
    Given Session S1. I am on Car Finder Screen
    Given Session S1. I store the list visible on Car Finder Screen
    When Session S1. I tap on plus button
    And Session S1. I tap on sort button
    Then Session S1. I tap on Featured
    Then Session S1. Verify sorted list for Featured


