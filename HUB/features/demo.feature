Feature: Demo Feature
   As a HUB app user
   I want to navigate the app from home screen
   So that I can  see all the functions working as per expected 

@Android @HUB-00
 Scenario: As a valid app user for HUB
 When I press "Login"
 Then I see "Welcome to coolest app ever"
  

@Android @HUB-01
Scenario: Tapping elements throught the App
 Given Session S1. I tap on LeftMenu
  Then Session S1. I tap on myStay
  When Session S1. I tap on LeftMenu
  Then Session S1. I tap on myBookings
  When Session S1. I tap on LeftMenu
  Then Session S1. I tap on myAccount
  When Session S1. I tap on LeftMenu
  Then Session S1. I tap on info
  When Session S1. I tap on LeftMenu
  Then Session S1. I tap on debug
  When Session S1. I tap on LeftMenu
  Then Session S1. Display AppVersion