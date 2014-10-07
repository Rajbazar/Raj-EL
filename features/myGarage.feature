@MyGarage
Feature:Verifying My Garage Listings
   As a app user
   I want to check the list of selected cars in my Garage
   So that I can choose best of one for applying a loan


@Android @EL-301
 Scenario: Choosing choise of cars from Car Finder listings
   Given Session S1. I am on CarFinder screen
    Then Session S1. I should see list of cars
    When Session S1. I tap on selected car
    Then Session S1. I should see selected car details screen
     And Session S1. I tap on car+ symbol on top righthand corner on the app
    Then Session S1. I should see  a small popup  message "car added to the garage"  
    When Session S1. I tap on back button 
    Then Session S1. I should be back to the Car Finder screen


@Android @EL-302
 Scenario: navigating to My Garage from CarFinder Screen 
   Given Session S1. I tap on car symbol from top rightand corner on the app
    Then Session S1. I should see My Garage screen
     And Session S1. I shlould see all selected cars
     And Session S1. I should able to scroll up and down to view my garage lsitings
     And Session S1. I should see Apply For Loan banner on the bottom 

   


    