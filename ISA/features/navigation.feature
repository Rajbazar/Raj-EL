Feature: Navigation Feature
   As a Santander ISA app user
   I want to navigate the app from Landing page
   So that I can  see all the functions working as per expected 

@IOS @Android @ISA-01
 Scenario: Navigate complete app
    Given Session S1. Display complete-text on landing page
     When Session S1. I tap on RightMenu
     Then Session S1. I tap on Settings
     When Session S1. I tap on RightMenu
     Then Session S1. I tap on Apply
      And Session S1. I tap on HardBackButton
     When Session S1. I tap on RightMenu
     Then Session S1. I tap on Upgrade
      And Session S1. I tap on HardBackButton
     When Session S1. I tap on RightMenu
     Then Session S1. I tap on Transfer
      And Session S1. I tap on HardBackButton
     When Session S1. I tap on RightMenu
     Then Session S1. I tap on Calculator
      And Session S1. I tap on HardBackButton



@IOS @Android @ISA-02
 Scenario: Learn more aout ISA
     When Session S1. I tap on Fixed rate cash ISAs
     Then Session S1. Display complete-text on RatePage
     Then Session S1. I tap on HardBackButton
     When Session S1. I tap on Variable rate cash ISAs
     Then Session S1. Display complete-text on RatePage
      And Session S1. I tap on HardBackButton
     When Session S1. I tap on Paying into your cash ISA
     Then Session S1. Display complete-text on RatePage
      And Session S1. I tap on HardBackButton
     When Session S1. I tap on What are cash ISAs?
     Then Session S1. Display complete-text on Page
      And Session S1. I tap on HardBackButton
      And Session S1. Scroll down
      And Session S1. Scroll down
     Then Session S1. Verify Clock from 5th April
      And Session S1. Scroll up
      And Session S1. Scroll up
      And Session S1. Scroll up

@IOS @Android @ISA-03
 Scenario: Display Full Product Details for Fixed rate Cash ISAs
     Given Session S1. I tap on Fixed rate cash ISAs
      When Session S1. Click Continue to Full Details
      Then Session S1. Display complete-text on MoreDetailsPage
       And Session S1. I tap on HardBackButton


@IOS @Android @ISA-04
 Scenario: Display Full Product Details for Variable rate cash ISAs
     Given Session S1. I tap on Variable rate cash ISAs
      When Session S1. Click Continue to Full Details
      Then Session S1. Display complete-text on MoreDetailsPage
       And Session S1. I tap on HardBackButton

@IOS @ISA-05
 Scenario: Display Text on Apply/Upgrade Screen for Fixed rate cash ISAs 
     Given Session S1. I tap on Fixed rate cash ISAs
     Then Session S1. Scroll down
     When Session S1. Click Apply
     Then Session S1. Display complete-text on ApplyUpgradeScreen
      And Session S1. I tap on HardBackButton
      And Session S1. I tap on HardBackButton


@IOS @ISA-06
 Scenario: Display Text on Apply/Upgrade Screen for Variable rate cash ISAs
     Given Session S1. I tap on Variable rate cash ISAs
     Then Session S1. Scroll down
     When Session S1. Click Apply
     Then Session S1. Display complete-text on ApplyUpgradeScreen 
      And Session S1. I tap on HardBackButton
      And Session S1. I tap on HardBackButton    


@IOS @ISA-07
 Scenario: Display Text on information screen for fixed rate
      Given Session S1. I tap on Fixed rate cash ISAs
       When Session S1. Click iButton
       Then Session S1. Display complete-text on Screen
        And Session S1. I tap on HardBackButton
        And Session S1. I tap on HardBackButton

@IOS @ISA-08
 Scenario: Display Text on information screen for Variable rate
      Given Session S1. I tap on Variable rate cash ISAs
       When Session S1. Click iButton
       Then Session S1. Display complete-text on Screen
        And Session S1. I tap on HardBackButton
        And Session S1. I tap on HardBackButton


@IOS @Android @ISA-09
Scenario: Navigate to Santander webview 
 Given I am on Santander ISA Landing page  
  When I tap on Fund your ISA
  Then I should be able to see Transfer ISA to Santander
   And I should be able to see Weblink
  When I tap on menu
  Then I should be able to navigate back to landing screen






