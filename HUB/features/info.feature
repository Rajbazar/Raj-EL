Feature:  info Feature
  As a HUB app user
  I want to navigate to info
  So that I can able to send the feedback and check for T&C and FAQs


@iOS @Android @HUB-05
  Scenario: As a HUB user, I would able to send feedback, to check HUB T&C and FAQs

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
     And Session S1. Scroll down
    And I wait for 5 seconds
    When Session S1. I tap on backButton
    Then Session S1. I tap on Terms & conditions
     And Session S1. Scroll down
     And Session S1. Scroll down
    And I wait for 5 seconds
    When Session S1. I tap on backButton
    When Session S1. I tap on Privacy policy
     And Session S1. Scroll down
     And Session S1. Scroll down
     And I wait for 5 seconds
    Then Session S1. I tap on backButton 

