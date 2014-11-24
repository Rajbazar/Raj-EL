Feature: Booking Feature
   As a HUB app user
   I want to book a room

@Android @HUB-21
Scenario: Tapping elements throught the App
  Given Session S1. Enter user details
  Given Session S1. Enter Card details
  Then Session S1. I tap on LeftMenu
  Then Session S1. I tap on hub by Premier Inn
  And I wait for 5 seconds
  Given Session S1. I tap on ChechAvailability
  Then Session S1. Select ArrivingDate as 21,March,2015
  Then Session S1. Select LeavingDate as 24,March,2015
  Then Session S1. Book Accessible room for 2 adults
  Then Session S1. I tap on Search
  Then Session S1. I should see Hub Flex Price and Hub Saver price
  Then Session S1. Book now for Hub flex Price
  And Session S1. I tap on Next
  And Session S1. Select Nationality as United Kingdom
  And Session S1. Enter second guest details
  And Session S1. I tap on Next
  And Session S1. Scroll down
  And Session S1. Scroll down
  And Session S1. I tap on Breakfast for all
  And Session S1. Save 3 days Breakfast price for 2 persons
  And Session S1. I tap on Next
  And Session S1. Add charity Fund
  And Session S1. I select Terms and Conditions
  And Session S1. I fill Security code
  Then Session S1. I tap on Work
  Then Session S1. I tap on Pay
  And Session S1. Verify complete flexi price
  And Session S1. I tap on Authunticated
  Then Session S1. I should be able to see Booking confirmed screen
  Then Session S1. I tap on Done











