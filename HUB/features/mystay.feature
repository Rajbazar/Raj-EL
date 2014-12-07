Feature: MyStay Feature
  As a HUB app user
  I want to navigate from My Stay
  So that I can able control my room

@Android @HUB-401
 Scenario: As an a HUB user, I would like to navigate from my Stay to control Lightings

    Then Session S1. Clear data
    Given Session S1. I am on HUB home page
     When Session S1. I tap on LeftMenu
     Then Session S1. I tap on myBookings
     When Session S1. I tap on LeftMenu
     Then Session S1. I tap on debug
      And Session S1. I tap on DontBotherWifiCheck
      And Session S1. I tap on LeftMenu
     Then Session S1. I tap on myBookings
     When Session S1. I tap on LeftMenu
      And Session S1. Scroll up
      And Session S1. Scroll up
     When Session S1. I tap on myStay
     When Session S1. I tap on Connect Now
     Then Session S1. Enter email and password for room-connection
      And Session S1. Control Lighting
      When Session S1. I tap on OK, got it
      And Session S1. Switch ON Light if OFF
     Then Session S1. Select full light bulb
      And Session S1. Decrease Brightness
      And Session S1. Increase Brightness
      And Session S1. Switch OFF Light
     Then Session S1. I tap on lightCloseButton

@Android @HUB-402
 Scenario: As an a HUB user, I would like to navigate from my Stay to control Reading Bulbs

     Then Session S1. Clear data
     Given Session S1. I am on HUB home page
     When Session S1. I tap on LeftMenu
     Then Session S1. I tap on myBookings
     When Session S1. I tap on LeftMenu
     Then Session S1. I tap on debug
     And Session S1. I tap on DontBotherWifiCheck
     And Session S1. I tap on LeftMenu
     Then Session S1. I tap on myBookings
     When Session S1. I tap on LeftMenu
     And Session S1. Scroll up
     And Session S1. Scroll up
     When Session S1. I tap on myStay
     When Session S1. I tap on Connect Now
     Then Session S1. Enter email and password for room-connection
     And Session S1. Control Lighting
     When Session S1. I tap on OK, got it
     And Session S1. Switch ON Light if OFF
     And Session S1. Switch to Reading mode
     And Session S1. Turn off Bulb1
     Then Session S1. I tap on lightCloseButton

 @Android @HUB-403
  Scenario: As an a HUB user, I would like to navigate from my Stay to control Room Temperature

    Then Session S1. Clear data
    Given Session S1. I am on HUB home page
    When Session S1. I tap on LeftMenu
    Then Session S1. I tap on myBookings
    When Session S1. I tap on LeftMenu
    Then Session S1. I tap on debug
    And Session S1. I tap on DontBotherWifiCheck
    And Session S1. I tap on LeftMenu
    Then Session S1. I tap on myBookings
    When Session S1. I tap on LeftMenu
    And Session S1. Scroll up
    And Session S1. Scroll up
    When Session S1. I tap on myStay
    When Session S1. I tap on Connect Now
    Then Session S1. Enter email and password for room-connection
    And Session S1. Control Temperature
    When Session S1. I tap on OK, got it
    And Session S1. Switch ON TemperatureControl if OFF
    Then Session S1. Set temperature to 19 degrees
    Then Session S1. I tap on tempCloseButton

  @Android @HUB-404
  Scenario: As an a HUB user, I would like to navigate from my Stay to control Fan speed

    Then Session S1. Clear data
    Given Session S1. I am on HUB home page
    When Session S1. I tap on LeftMenu
    Then Session S1. I tap on myBookings
    When Session S1. I tap on LeftMenu
    Then Session S1. I tap on debug
    And Session S1. I tap on DontBotherWifiCheck
    And Session S1. I tap on LeftMenu
    Then Session S1. I tap on myBookings
    When Session S1. I tap on LeftMenu
    And Session S1. Scroll up
    And Session S1. Scroll up
    When Session S1. I tap on myStay
    When Session S1. I tap on Connect Now
    Then Session S1. Enter email and password for room-connection
    And Session S1. Control Temperature
    When Session S1. I tap on OK, got it
    And Session S1. Switch ON TemperatureControl if OFF
    And Session S1. Select full Fan button
    Then Session S1. I tap on tempCloseButton

  @Android @HUB-406
  Scenario: Display Room-Connect code

    Given Session S1. I am on HUB home page
    When Session S1. I tap on LeftMenu
    When Session S1. I tap on myStay
    When Session S1. I tap on Help
    Then Session S1. Display room connect code
