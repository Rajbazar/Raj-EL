@MyGarage
Feature:Verifying My Garage Listings
   As a app user
   I want to check the list of selected cars in my Garage
   So that I can choose best of one for applying a loan


@Android @EL-300
 Scenario: Adding cars to my garage from Car Finder listings
   Given Session S1. I am on Car Finder Screen
    Then Session S1. Select car Transformers Optimus Prime
     And Session S1. I add the selected car in my garage
    Then Session S1. Verify pop up text as Car Added to Garage
    Then Session S1. I press back button
    Then Session S1. Verify car Transformers Optimus Prime is being added to Garage
    Then Session S1. I tap on Transformers Optimus Prime
     And Session S1. I remove the selected car from my garage
    Then Session S1. Verify pop up text as Car removed from garage
    Then Session S1. I press back button
    Then Session S1. I press back button



@Android @EL-301
 Scenario: navigate selected car lsitings and journey to loan application
      Given Session S1. Create profile
      Given Session S1. I tap on LeftMenu
      When Session S1. I tap on CarFinder
      Given Session S1. I am on Car Finder Screen
      Then Session S1. Select car Transformers Optimus Prime
      And Session S1. I add the selected car in my garage
      Then Session S1. Verify pop up text as Car Added to Garage
      Then Session S1. I press back button
      Then Session S1. Verify car Transformers Optimus Prime is being added to Garage
      Then Session S1. I tap on Transformers Optimus Prime
      Then Session S1. Apply for Loan
      Then Session S1. Display reference code
       And Session S1. I tap on DONE
      And Session S1. I remove the selected car from my garage
      Then Session S1. Verify pop up text as Car removed from garage
      Then Session S1. I press back button
      Then Session S1. I press back button
   


    