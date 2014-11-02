@EndtoEnd
Feature:Basic Navigation
   As a app user
   I want to navigate the app from home screen
   So that I can  see all the functions working as per expected 
    

@Android @EL-100
 Scenario: Select Language as English
   Given Session S1. I tap on English 
   Given Session S2. I tap on English
    When Session S1. I tap on DONE
    When Session S2. I tap on DONE
     And I wait for 10 seconds


@Android @SingleDevice @EL-101 
 Scenario: To get the list from the Car Finder screen
   Given Session S1. I tap on LeftMenu
    When Session S1. I tap on CarFinder 
     And I wait for 10 seconds
    Then Session S1. I should see the CarFinder Listings

 @Android @MultipleDevice @EL-102 
  Scenario: To get the list from the Car Finder screen
    Given Session S1. I tap on LeftMenu
    Given Session S2. I tap on LeftMenu
     When Session S1. I tap on CarFinder
     When Session S2. I tap on CarFinder
      And I wait for 10 seconds
      And I wait for 10 seconds
     Then Session S1. I should see the CarFinder Listings    
     Then Session S2. I should see the CarFinder Listings 

 
 @Android @SingleDevice @EL-103
  Scenario: Navigate to the Scan & Shop list
    Given Session S1. I tap on LeftMenu
     When Session S1. I tap on Scan & Shop
      And I wait for 10 seconds
     Then Session S1. I should see camera and basket under Scan & Shop  

 @Android @MultipleDevice @EL-104
  Scenario: To get the list from the Scan & Shop  list
    Given Session S1. I tap on LeftMenu
    Given Session S2. I tap on LeftMenu
     When Session S1. I tap on Scan & Shop
     When Session S2. I tap on Scan & Shop
      And I wait for 10 seconds
      And I wait for 10 seconds
     Then Session S1. I should see camera and basket under Scan & Shop     
     Then Session S2. I should see camera and basket under Scan & Shop  
     

 @Android @SingleDevice @EL-105
  Scenario: Navigate to the Application History list
    Given Session S1. I tap on LeftMenu
     When Session S1. I tap on Application History
      And I wait for 10 seconds
     Then Session S1. I should see the Application History Listings


@Android @MultipleDevice @EL-106
 Scenario: To get the list from the Application History list
   Given Session S1. I tap on LeftMenu
   Given Session S2. I tap on LeftMenu
    When Session S1. I tap on Application History
    When Session S2. I tap on Application History
     And I wait for 10 seconds
     And I wait for 10 seconds
     Then Session S1. I should see the Application History Listings    
     Then Session S2. I should see the Application History Listings 


@Android @SingleDevice @EL-107
 Scenario: Navigate to the More list
   Given Session S1. I tap on LeftMenu
    When Session S1. I tap on More
     And I wait for 10 seconds
     Then Session S1. I should see the More Listings                   
    


@Android @MultipleDevice @EL-108
 Scenario: To get the list from the More screen
    Given Session S1. I tap on LeftMenu
    Given Session S2. I tap on LeftMenu
     When Session S1. I tap on More
     When Session S2. I tap on More
      And I wait for 10 seconds
      And I wait for 10 seconds
     Then Session S1. I should see the More Listings    
     Then Session S2. I should see the More Listings     

  
@Android @SingleDevice @EL-109
 Scenario: Change the language from More Screen
   Given Session S1. I tap on LeftMenu
    When Session S1. I tap on More
     And I wait for 10 seconds
     Then Session S1. I tap on Change language
     Then Session S1. I tap on Russian
     Then Session S1. I tap on DONE
     Then Session S1. I tap on Change language
     Then Session S1. I tap on Kazakh
     Then Session S1. I tap on DONE
     Then Session S1. I tap on Change language
     Then Session S1. I tap on English
     Then Session S1. I tap on DONE




      


      


