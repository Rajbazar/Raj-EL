@EndtoEnd

Feature:Sort Button

@Android @SingleDevice @EL-401
 Scenario: Verify sorted list in order of 'Featured'
   Given Session S1. I am on Car Finder Screen
   Given Session S1. I store the list visible on Car Finder Screen
    When Session S1. I tap on plus button
     And Session S1. I tap on sort button
    Then Session S1. I tap on Featured
    Then Session S1. Verify sorted list for Featured

@Android @SingleDevice @EL-402
 Scenario: Verify sorted list in order of 'Price: lowest first'
   Given Session S1. I am on Car Finder Screen
   Given Session S1. I store the list visible on Car Finder Screen
    When Session S1. I tap on plus button
     And Session S1. I tap on sort button
    Then Session S1. I tap on Price: lowest first
    Then Session S1. Verify sorted list for Price: lowest first

@Android @SingleDevice @EL-403
 Scenario: Verify sorted list in order of 'Price: lowest first'
   Given Session S1. I am on Car Finder Screen
   Given Session S1. I store the list visible on Car Finder Screen
    When Session S1. I tap on plus button
     And Session S1. I tap on sort button
    Then Session S1. I tap on Price: highest first
    Then Session S1. Verify sorted list for Price: highest first

@Android @SingleDevice @EL-404
 Scenario: Apply Loan after sorting as 'Featured'
   Given Session S1. Create profile
   Given Session S1. I am on Car Finder Screen
    When Session S1. I tap on plus button
     And Session S1. I tap on sort button
    Then Session S1. I tap on Featured
    Then Session S1. Select car DC Batmobile mark I
    Then Session S1. Apply for Loan
    Then Session S1. Verify and display reference code
     And Session S1. I tap on DONE
