Feature: My Account

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




