@MyGarage
Feature:Verifying My Garage Listings
   As a app user
   I want to check the list of selected cars in my Garage
   So that I can choose best of one for applying a loan


@Android @EL-501
 Scenario: Adding cars to my garage from Car Finder listings
   Given Session S1. I am on Car Finder Screen
    Then Session S1. Select car DC Batmobile mark I
     And Session S1. I add the selected car in my garage
    Then Session S1. Verify pop up text as Car Added to Garage
    Then Session S1. I press back button
    Then Session S1. Verify car DC Batmobile mark I is being added to Garage
    Then Session S1. I tap on DC Batmobile mark I
    And Session S1. I remove the selected car from my garage
    Then Session S1. Verify pop up text as Car removed from garage
    Then Session S1. I press back button
    Then Session S1. I press back button



@Android @EL-3002
 Scenario: navigating to My Garage from CarFinder Screen 
   Given Session S1. I tap on car symbol from top rightand corner on the app
    Then Session S1. I should see My Garage screen
     And Session S1. I shlould see all selected cars
     And Session S1. I should able to scroll up and down to view my garage lsitings
     And Session S1. I should see Apply For Loan banner on the bottom 

   


    