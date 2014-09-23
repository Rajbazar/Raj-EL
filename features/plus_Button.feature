@EndtoEnd

Feature:Plus Button

  @Android @EL-200
  Scenario: Select Language as English
    Given Session S1. I tap on English
    When Session S1. I tap on DONE
    And I wait for 10 seconds

  @Android @SingleDevice @EL-201
 Scenario: Verify the presence of Plus button
 Given Session S1. I am on Car Finder Screen
   And Session S1. Verify the plus button
  When Session S1. I tap on plus button
  Then Session S1. Verify the options bar

  @Android @SingleDevice @EL-202
Scenario: Verify the search functionality of Plus button
 Given Session S1. I am on Car Finder Screen
  When Session S1. I tap on plus button
   And Session S1. Verify the search button
   And Session S1. I tap on search button
  Then Session S1. Verify the Search Cars banner
   And Session S1. Enter CarName as Renault Banger
   And Session S1. Verify text in Car Details as Renault Banger



@Android @SingleDevice @EL-203
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

@Android @SingleDevice @EL-204
Scenario: Verify the presence of Filter Button
  Given Session S1. I am on Car Finder Screen
  When Session S1. I tap on plus button
  And Session S1. Verify the filter button
  And Session S1. I tap on filter button
  Then Session S1. I press back button

