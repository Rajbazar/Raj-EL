@EndtoEnd

Feature:Plus Button verification

@Android @SingleDevice @EL-200
 Scenario: Select Language as English
   Given Session S1. I tap on English
    When Session S1. I tap on DONE
     And I wait for 10 seconds

@Android @MultipleDevice @EL-201
 Scenario: Select Language as English
   Given Session S1. I tap on English
   Given Session S2. I tap on English
    When Session S1. I tap on DONE
    When Session S2. I tap on DONE
     And I wait for 10 seconds     

 @Android @SingleDevice @EL-202
  Scenario: Verify the presence of Plus button
    Given Session S1. I am on Car Finder Screen
      And Session S1. Verify the plus button
     When Session S1. I tap on plus button
     Then Session S1. Verify the options bar

@Android @MultipleDevice @EL-203
  Scenario: Verify the presence of Plus button
    Given Session S1. I am on Car Finder Screen
    Given Session S2. I am on Car Finder Screen
      And Session S1. Verify the plus button
      And Session S2. Verify the plus button
     When Session S1. I tap on plus button
     When Session S2. I tap on plus button
     Then Session S1. Verify the options bar
     Then Session S2. Verify the options bar


@Android @SingleDevice @EL-204
 Scenario: Verify the search functionality of Plus button
   Given Session S1. I am on Car Finder Screen
    When Session S1. I tap on plus button
     And Session S1. Verify the search button
     And Session S1. I tap on search button
    Then Session S1. Verify the Search Cars banner
     And Session S1. Enter CarName as acbcv abvb
     And Session S1. Verify text in Car Details as acbcv abvb

@Android @MultipleDevice @EL-205
 Scenario: Verify the search functionality of Plus button
   Given Session S1. I am on Car Finder Screen
   Given Session S2. I am on Car Finder Screen
    When Session S1. I tap on plus button
    When Session S2. I tap on plus button
     And Session S1. Verify the search button
     And Session S2. Verify the search button
     And Session S1. I tap on search button
     And Session S2. I tap on search button
    Then Session S1. Verify the Search Cars banner
    Then Session S2. Verify the Search Cars banner
     And Session S1. Enter CarName as ACBCV ABVB
     And Session S2. Enter CarName as ACBCV ABVB
     And Session S1. Verify text in Car Details as ACBCV ABVB 
     And Session S2. Verify text in Car Details as ACBCV ABVB



@Android @SingleDevice @EL-206
 Scenario: Verify the text under sort button
   Given Session S1. I am on Car Finder Screen
    When Session S1. I tap on plus button
     And Session S1. Verify the sort button
     And Session S1. I tap on sort button
    Then Session S1. Verify text under Sort Button Featured
    Then Session S1. Verify text under Sort Button Manufacturer
    Then Session S1. Verify text under Sort Button Price: lowest first
    Then Session S1. Verify text under Sort Button Price: highest first
     And Session S1. I tap on sort button

@Android @MultipleDevice @EL-207
 Scenario: Verify the text under sort button
   Given Session S1. I am on Car Finder Screen
   Given Session S2. I am on Car Finder Screen
    When Session S1. I tap on plus button
    When Session S2. I tap on plus button
     And Session S1. Verify the sort button
     And Session S2. Verify the sort button
     And Session S1. I tap on sort button
     And Session S2. I tap on sort button
    Then Session S1. Verify text under Sort Button Featured
    Then Session S2. Verify text under Sort Button Featured
    Then Session S1. Verify text under Sort Button Manufacturer
    Then Session S2. Verify text under Sort Button Manufacturer
    Then Session S1. Verify text under Sort Button Price: lowest first
    Then Session S2. Verify text under Sort Button Price: lowest first
    Then Session S1. Verify text under Sort Button Price: highest first
    Then Session S2. Verify text under Sort Button Price: highest first
     And Session S1. I tap on sort button
     And Session S2. I tap on sort button     

@Android @SingleDevice @EL-208
 Scenario: Verify the presence of Filter Button
   Given Session S1. I am on Car Finder Screen
   When Session S1. I tap on plus button
    And Session S1. Verify the filter button
    And Session S1. I tap on filter button
   Then Session S1. I press back button

@Android @MultipleDevice @EL-209
 Scenario: Verify the presence of Filter Button
   Given Session S1. I am on Car Finder Screen
   Given Session S2. I am on Car Finder Screen
    When Session S1. I tap on plus button
    When Session S2. I tap on plus button
     And Session S1. Verify the filter button
     And Session S2. Verify the filter button
     And Session S1. I tap on filter button
     And Session S2 I tap on filter button
    Then Session S1. I press back button
   Then Session S2. I press back button


