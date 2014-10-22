@EndtoEnd

Feature:Sort Button

@Android @SingleDevice @EL-500
Scenario: Store the List on Car Finder Screen
  Given Session S1. I am on Car Finder Screen
  Given Session S1. I store the list visible on Car Finder Screen

@Android @SingleDevice @EL-501
 Scenario: Verify sorted list in order of 'Featured'
    When Session S1. I tap on plus button
     And Session S1. I tap on sort button
    Then Session S1. I tap on Featured
    Then Session S1. Verify sorted list for Featured

@Android @SingleDevice @EL-502
 Scenario: Verify sorted list in order of 'Price: lowest first'
    When Session S1. I tap on plus button
     And Session S1. I tap on sort button
    Then Session S1. I tap on Price: lowest first
    Then Session S1. Verify sorted list for Price: lowest first

@Android @SingleDevice @EL-503
 Scenario: Verify sorted list in order of 'Price: lowest first'
    When Session S1. I tap on plus button
     And Session S1. I tap on sort button
    Then Session S1. I tap on Price: highest first
    Then Session S1. Verify sorted list for Price: highest first

@Android @SingleDevice @EL-504
 Scenario: Apply Loan after sorting as 'Featured'
    Given Session S1. Create profile
    Given Session S1. I tap on LeftMenu
     When Session S1. I tap on CarFinder
    Given Session S1. I am on Car Finder Screen
     When Session S1. I tap on plus button
      And Session S1. I tap on sort button
     Then Session S1. I tap on Featured
     Then Session S1. Select car Transformers Optimus Prime
     Then Session S1. Apply for Loan
     Then Session S1. Display reference code
      And Session S1. I tap on DONE
