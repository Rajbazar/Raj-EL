Feature: My Account
  As a HUB app user
  I want to navigate to My account
  So that I can able to add my details and guest details

@Android @HUB-301
  Scenario: Enter Account Information
    Then Session S1. Clear data
    Given Session S1. Enter user details
    Given Session S1. Enter Card details

@Android @HUB-302
  Scenario: Display Account Information
    Given Session S1. I tap on LeftMenu
    Then Session S1. I tap on myAccount
    Then Session S1. Display user Name
    Then Session S1. I tap on My details
    Then Session S1. Display user Contact
    And Session S1. Scroll down
    And Session S1. Scroll down
    Then Session S1. Display user Address
    Then Session S1. I tap on backButton
    Then Session S1. Display user securedCardNumber
    Then Session S1. I tap on My payment card
    Then Session S1. Display user cardDetails
    Then Session S1. I tap on backButton

@IOS @Android @HUB-303
  Scenario: Add contact in my account
    Given Session S1. I tap on LeftMenu
    Then Session S1. I tap on myStay
    When Session S1. I tap on LeftMenu
    And Session S1. Scroll down
    Then Session S1. I tap on myAccount
    And I wait for 2 seconds
    Then Session S1. I tap on My contacts
    And I wait for 5 seconds
    Then Session S1. I tap on plusSign
    And I wait for 2 seconds
    Then Session S1. Add Title as Mr
    Then Session S1. Add FirstName as Sam
    Then Session S1. Add LastName as Smith
    Then Session S1. Add Nationality as United Kingdom
    Then Session S1. I tap on Save

@IOS @Android @HUB-304
Scenario: Remove account from my account
  Given Session S1. I tap on LeftMenu
  Then Session S1. I tap on myStay
  When Session S1. I tap on LeftMenu
  And Session S1. Scroll down
  Then Session S1. I tap on myAccount
  And I wait for 2 seconds
  Then Session S1. I tap on My contacts
  And I wait for 5 seconds
  Then Session S1. I tap on Sam Smith
  Then Session S1. I tap on Delete
  And I wait for 2 seconds
  Then Session S1. I tap on Confirm



