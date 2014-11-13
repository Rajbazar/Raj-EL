@EndtoEnd

Feature:Sort Button

@Android @SingleDevice @EL-500
  Scenario: Store the List on Car Finder Screen
   Given Session S1. I am on Car Finder Screen
   Given Session S1. I store the list visible on Car Finder Screen

@Android @MultipleDevice @EL-501
  Scenario: Store the List on Car Finder Screen
   Given Session S1. I am on Car Finder Screen
   Given Session S2. I am on Car Finder Screen
   Given Session S1. I store the list visible on Car Finder Screen
   Given Session S2 I store the list visible on Car Finder Screen


@Android @SingleDevice @EL-502
  Scenario: Verify sorted list in order of 'Featured'
    When Session S1. I tap on plus button
     And Session S1. I tap on sort button
    Then Session S1. I tap on Featured
    Then Session S1. Verify sorted list for Featured

@Android @MultipleDevice @EL-503 
  Scenario: Verify sorted list in order of 'Featured'
    When Session S1. I tap on plus button
    When Session S2. I tap on plus button
     And Session S1. I tap on sort button
     And Session S2. I tap on sort button
    Then Session S1. I tap on Featured
    Then Session S2. I tap on Featured
    Then Session S1. Verify sorted list for Featured
    Then Session S2. Verify sorted list for Featured


@Android @SingleDevice @EL-504
  Scenario: Verify sorted list in order of 'Price: lowest first'
    When Session S1. I tap on plus button
     And Session S1. I tap on sort button
    Then Session S1. I tap on Price: lowest first
    Then Session S1. Verify sorted list for Price: lowest first



@Android @MultipleDevice @EL-505
  Scenario: Verify sorted list in order of 'Price: lowest first'
    When Session S1. I tap on plus button
    When Session S2. I tap on plus button
     And Session S1. I tap on sort button
     And Session S2. I tap on sort button
    Then Session S1. I tap on Price: lowest first
    Then Session S2. I tap on Price: lowest first
    Then Session S1. Verify sorted list for Price: lowest first 
    Then Session S2. Verify sorted list for Price: lowest first    
   


@Android @SingleDevice @EL-506
  Scenario: Verify sorted list in order of 'Price: lowest first'
   When Session S1. I tap on plus button
    And Session S1. I tap on sort button
   Then Session S1. I tap on Price: highest first
   Then Session S1. Verify sorted list for Price: highest first

@Android @MultipleDevice @EL-507 
  Scenario: Verify sorted list in order of 'Price: lowest first'
   When Session S1. I tap on plus button
   When Session S2. I tap on plus button
    And Session S1. I tap on sort button
    And Session S2. I tap on sort button
   Then Session S1. I tap on Price: highest first
   Then Session S2. I tap on Price: highest first
   Then Session S1. Verify sorted list for Price: highest first
   Then Session S2. Verify sorted list for Price: highest first



@Android @SingleDevice @EL-508
  Scenario: Apply Loan after sorting as 'Featured'
    Given Session S1. Create profile
     When Session S1. I tap on LeftMenu
      And Session S1. I tap on CarFinder
     Then Session S1. I am on Car Finder Screen
     When Session S1. I tap on plus button
      And Session S1. I tap on sort button
      And Session S1. I tap on Featured
     Then Session S1. Select car Transformers Optimus Prime
     Then Session S1. Apply for Loan
      And Session S1. Display reference code
     Then Session S1. I tap on DONE



@Android @MultipleDevice @EL-509
  Scenario: Apply Loan after sorting as 'Featured'
    Given Session S1. Create profile
    Given Session S2. Create profile
     When Session S1. I tap on LeftMenu
     When Session S2. I tap on LeftMenu
      And Session S1. I tap on CarFinder
      And Session S2. I tap on CarFinder
     Then Session S1. I am on Car Finder Screen
     Then Session S2. I am on Car Finder Screen
     When Session S1. I tap on plus button
     When Session S2. I tap on plus button
      And Session S1. I tap on sort button
      And Session S2. I tap on sort button
      And Session S1. I tap on Featured
      And Session S2. I tap on Featured
     Then Session S1. Select car Transformers Optimus Prime
     Then Session S2. Select car Transformers Optimus Prime
     Then Session S1. Apply for Loan
     Then Session S2. Apply for Loan 
      And Session S1. Display reference code
      And Session S2. Display reference code
     Then Session S1. I tap on DONE
     Then Session S2. I tap on DONE

