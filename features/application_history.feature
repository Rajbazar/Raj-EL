@EndtoEnd

Feature:Application History

@Android @SingleDevice @EL-701
  Scenario: Verify Application History
     Given Session S1. Create profile
     When Session S1. I tap on LeftMenu
      And Session S1. I tap on CarFinder
      Then Session S1. I am on Car Finder Screen
      When Session S1. Select car Transformers Optimus Prime
      And I wait for 10 seconds
      When Session S1. Apply for Loan
      Then Session S1. Display reference code
      And Session S1. I tap on DONE
      Then Session S1. I press back button
      When Session S1. I tap on LeftMenu
      When Session S1. I tap on Application History
      Then Session S1. Verify Transformers Optimus Prime car is added 1-times in Application History with current date
