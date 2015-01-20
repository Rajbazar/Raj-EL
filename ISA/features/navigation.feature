Feature: Navigation Feature
   As a Santander ISA app user
   I want to navigate the app from Landing page
   So that I can  see all the functions working as per expected 

@IOS @Android @ISA-00
 Scenario: Navigate complete app
     Then Session S1. Display complete-text on landing page
     Then Session S1. I tap on RightMenu
     Then Session S1. I tap on Settings
     Then Session S1. I tap on RightMenu
     Then Session S1. I tap on Apply
     Then Session S1. I tap on HardBackButton
     Then Session S1. I tap on RightMenu
     Then Session S1. I tap on Upgrade
     Then Session S1. I tap on HardBackButton
     Then Session S1. I tap on RightMenu
     Then Session S1. I tap on Transfer
     Then Session S1. I tap on HardBackButton
     Then Session S1. I tap on RightMenu
     Then Session S1. I tap on Calculator
     Then Session S1. I tap on HardBackButton
  
@IOS @Android @ISA-01
Scenario: Calculator Sample
  Then Session S1. I tap on RightMenu
  Then Session S1. I tap on Calculator
  Then Session S1. Select investment amount
  Then Session S1. Display Interest rate
  Then Session S1. Display Interest earned
  Then Session S1. Display tax saved


@IOS @Android @ISA-02
Scenario: Learn more aout ISA
Given I am on Santander ISA Landing page  
 When I tap on FIXED RATE ISAs 
 Then I should able to see the more about lerning ISA 
  And I should able to see Push-notification
  And I sgould be able to see Legal information
  And I should be able to see FAQs
  And I wait for 10 seconds
 When I tap on menu
 Then I should be able to navigated back to landing screen


@IOS @Android @ISA-03
Scenario: Know more about product details
 Given I am on Santander ISA Landing page  
 When I tap on VARIABLE RATE ISAs
 Then I should be able to see ISA Product details
  And I should be able to see Savings calculator
  And I should be able to see Apply for a new ISA
  And I should be able to see Upgrade existing ISA
  And I svould be able to see Terms and conditions
 When I tap on menu
 Then I should be able to navigate back to landing screen


@IOS @Android @ISA-04
Scenario: Navigate to Santander webview 
 Given I am on Santander ISA Landing page  
  When I tap on Fund your ISA
  Then I should be able to see Transfer ISA to Santander
   And I should be able to see Weblink
  When I tap on menu
  Then I should be able to navigate back to landing screen






