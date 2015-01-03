Feature: MyStay Feature
  As a HUB app user
  I want to navigate from My Stay
  So that I can able control my room

@Android @HUB-401
 Scenario: As a HUB user, I would like to navigate from my Stay to control Lightings

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
 Scenario: As a HUB user, I would like to navigate from my Stay to control Reading Bulbs/Lighting section 

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

  @Android @HUB-405
  Scenario: Display Room-Connect code

    Given Session S1. I am on HUB home page
    When Session S1. I tap on LeftMenu
    When Session S1. I tap on myStay
    When Session S1. I tap on Help
    Then Session S1. Display room connect code


  @Android @HUB-406
  Scenario: As an a HUB user, I would like to control the TV channels

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
    And Session S1. Control TV
    And I wait for 30 seconds
    When Session S1. I tap on OK, got it
    And Session S1. Switch ON TVControl if OFF
    Then Session S1. I tap on Controls
    And Session S1. I change channel up
    When Session S1. I tap on info
    And I wait for 3 seconds
    Then Session S1. Display channel information
    Then Session S1. I tap on tvCloseButton



  @Android @HUB-407
  Scenario: As an a HUB user, I would like to control the TV volumes

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
    And Session S1. Control TV
    And I wait for 30 seconds
    When Session S1. I tap on OK, got it
    And Session S1. Switch ON TVControl if OFF
    Then Session S1. I tap on Controls
    When Session S1. I mute the TV volume
    When Session S1. I increase the TV volume
    When Session S1. I decrease the TV volume
    Then Session S1. I tap on tvCloseButton

  @Android @HUB-408
  Scenario: As an a HUB user, I would like to control the TV channels

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
    And Session S1. Control TV
    And I wait for 30 seconds
    When Session S1. I tap on OK, got it
    And Session S1. Switch ON TVControl if OFF
    Then Session S1. I tap on TV guide
    And I wait for 15 seconds
    Then Session S1. I should see the selected channel description
    Then Session S1. I tap on Controls
    Then Session S1. I tap on tvCloseButton


