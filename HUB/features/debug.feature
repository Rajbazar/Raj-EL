Feature: Debug Feature
  As a HUB app user
  I want to navigate to My debug
  So that I can see the connectivity option

  @Android @HUB-04
  Scenario: As an a HUB user, I would  like to be connected to WiFi

    When Session S1. I tap on LeftMenu
    Then Session S1. I tap on myBookings
    When Session S1. I tap on LeftMenu
    Then Session S1. I tap on debug
    And Session S1. I tap on DontBotherWifiCheck

  @Android @HUB-05
  Scenario: As an a HUB user, I would able to send feedback, to check HUB T&C and FAQs

    When Session S1. I tap on LeftMenu
    Then Session S1. I tap on myBookings
    When Session S1. I tap on LeftMenu
    Then Session S1. I tap on info
    Then Session S1. I tap on SendFeedback
    Then Session S1. Enter feedback user details and comments
    Then Session S1. I tap on Send
    And I wait for 5 seconds
    Then Session S1. I tap on OK
    Then Session S1. I tap on FAQs
    And I wait for 5 seconds
    When Session S1. I tap on backButton
    Then Session S1. I tap on Terms & conditions
    And I wait for 5 seconds
    When Session S1. I tap on backButton
    When Session S1. I tap on Privacy policy
    And I wait for 5 seconds
