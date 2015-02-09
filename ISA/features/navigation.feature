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
  
@Android @ISA-01
Scenario: Calculator Sample
  Then Session S1. I tap on RightMenu
  Then Session S1. I tap on Calculator
  Then Session S1. Select investment amount
  Then Session S1. Display Interest rate
  Then Session S1. Display Interest earned
  Then Session S1. Display tax saved


@IOS @Android @ISA-02
Scenario: Learn more aout ISA
 When Session S1. I tap on Fixed rate cash ISAs
 Then Session S1. Display complete-text on RatePage
 Then Session S1. I tap on HardBackButton
 When Session S1. I tap on Variable rate cash ISAs
 Then Session S1. Display complete-text on RatePage
 Then Session S1. I tap on HardBackButton
 When Session S1. I tap on Paying into your cash ISA
 Then Session S1. Display complete-text on RatePage
 Then Session S1. I tap on HardBackButton
 When Session S1. I tap on What are cash ISAs?
 Then Session S1. Display complete-text on Page
 Then Session S1. I tap on HardBackButton
 Then Session S1. Scroll down
 Then Session S1. Scroll down
 Then Session S1. Verify Clock from 5th April
 Then Session S1. Scroll up
 Then Session S1. Scroll up
 Then Session S1. Scroll up

@IOS @Android @ISA-03
Scenario: Display Full Product Details
    When Session S1. I tap on Fixed rate cash ISAs
    Then Session S1. Click Continue to Full Details
    Then Session S1. Display complete-text on MoreDetailsPage

@IOS @ISA-04
Scenario: Display Text on Apply/Upgrade Screen
When Session S1. I tap on Fixed rate cash ISAs
Then Session S1. Click Apply
Then Session S1. Display complete-text on ApplyUpgradeScreen


@IOS @ISA-05
Scenario: Display Text on Apply/Upgrade Screen
When Session S1. I tap on Fixed rate cash ISAs
Then Session S1. Click iButton
Then Session S1. Display complete-text on Screen


@IOS @Android @ISA-06
Scenario: Navigate to Santander webview 
 Given I am on Santander ISA Landing page  
  When I tap on Fund your ISA
  Then I should be able to see Transfer ISA to Santander
   And I should be able to see Weblink
  When I tap on menu
  Then I should be able to navigate back to landing screen






