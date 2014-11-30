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