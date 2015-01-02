Feature: Booking Feature
   As a HUB app user
   I want to book a room

@Android @HUB-21 
Scenario: Booking the room as a new HUB user
  Then Session S1. Clear data
  Given Session S1. Enter user details
  Given Session S1. Enter Card details
  Given Session S1. I am on HUB home page
  And I wait for 5 seconds
  Given Session S1. I tap on ChechAvailability
  Then Session S1. Select ArrivingDate as 16,March,2015
  Then Session S1. Select LeavingDate as 17,March,2015
  Then Session S1. Book Accessible room for 2 adults
  Then Session S1. I tap on Search
  Then Session S1. I should see Hub Flex Price and Hub Saver price
  Then Session S1. Book now for Hub flex Price
  And Session S1. I tap on Next
  And Session S1. Select Nationality United Kingdom
  And Session S1. Enter second guest details
  And Session S1. I tap on Next
  And Session S1. Scroll down
  And Session S1. Scroll down
  And Session S1. I tap on Breakfast for all
  And Session S1. Save 1 days Breakfast price for 2 persons
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

  

@Android @HUB-22
Scenario: Booking the room as an a Existing HUB user for 1 Adult only
  Given Session S1. I am on HUB home page
  And I wait for 5 seconds
  Given Session S1. I tap on ChechAvailability
  Then Session S1. Select ArrivingDate as 17,January,2015
  Then Session S1. Select LeavingDate as 18,January,2015
  Then Session S1. Book Accessible room for 1 adult
  Then Session S1. I tap on Search
  Then Session S1. I should see Hub Flex Price and Hub Saver price
  Then Session S1. Book now for Hub flex Price
  And Session S1. I tap on Next
  And Session S1. Select Nationality United Kingdom
  And Session S1. I tap on Next
  And Session S1. Scroll down
  And Session S1. Scroll down
  And Session S1. I tap on Breakfast for all
  And Session S1. Save 1 days Breakfast price for 1 persons
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



@Android @HUB-23
  Scenario: Booking the room with Saver Price for 1 adult and 1 child
    Given Session S1. I am on HUB home page
    And I wait for 5 seconds
    Given Session S1. I tap on ChechAvailability
    Then Session S1. Select ArrivingDate as 24,December,2014
    Then Session S1. Select LeavingDate as 26,December,2014
    Then Session S1. Book Standard room for 1adult and 1child
    Then Session S1. I tap on Search
    Then Session S1. I should see Hub Flex Price and Hub Saver price
    Then Session S1. Book now for Hub saver Price
    And Session S1. I tap on Next
    And Session S1. Select Nationality United Kingdom
    And Session S1. I tap on Next
    And Session S1. Scroll down
    And Session S1. Scroll down
    And Session S1. I tap on Breakfast for all
    And Session S1. Save 2 days Breakfast price for 2 persons
    And Session S1. I tap on Next
    And Session S1. Add charity Fund
    And Session S1. I select Terms and Conditions
    And Session S1. I fill Security code
    Then Session S1. I tap on Work
    Then Session S1. I tap on Pay
    And Session S1. Verify complete saver price
    And Session S1. I tap on Authunticated
    Then Session S1. I should be able to see Booking confirmed screen
    Then Session S1. I tap on Done


@Android @HUB-24
Scenario: Booking with Window less room as an a Existing HUB user
  Given Session S1. I am on HUB home page
  And I wait for 5 seconds
  Given Session S1. I tap on ChechAvailability
  Then Session S1. Select ArrivingDate as 1,April,2015
  Then Session S1. Select LeavingDate as 2,April,2015
  Then Session S1. Book Standard room for 1 adult
  Then Session S1. I tap on Search
  And I wait for 2 seconds
  When Session S1. I tap on OK Iam happy with this
  Then Session S1. I should see Hub Flex Price and Hub Saver price
  Then Session S1. Book now for Hub flex Price
  And Session S1. I tap on Next
  And Session S1. Select Nationality United Kingdom
  And Session S1. I tap on Next
  And Session S1. Scroll down
  And Session S1. Scroll down
  And Session S1. I tap on Breakfast for all
  And Session S1. Save 1 days Breakfast price for 1 persons
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

@Android @HUB-25
  Scenario: Booking for different nationality then UK
    Given Session S1. I am on HUB home page
    And I wait for 5 seconds
    Given Session S1. I tap on ChechAvailability
    Then Session S1. Select ArrivingDate as 3,March,2015
    Then Session S1. Select LeavingDate as 5,March,2015
    Then Session S1. Book Standard room for 1 adult
    Then Session S1. I tap on Search
    Then Session S1. I should see Hub Flex Price and Hub Saver price
    Then Session S1. Book now for Hub saver Price
    And Session S1. I tap on Next
    And Session S1. Select Nationality Afghanistan
    Then Session S1. Enter Passport details
    And Session S1. I tap on Next
    And Session S1. Scroll down
    And Session S1. Scroll down
    And Session S1. I tap on Breakfast for all
    And Session S1. Save 2 days Breakfast price for 1 persons
    And Session S1. I tap on Next
    And Session S1. Add Transaction fee
    And Session S1. Add charity Fund
    And Session S1. I select Terms and Conditions
    And Session S1. I fill Security code
    Then Session S1. I tap on Work
    Then Session S1. I tap on Pay
    And Session S1. Verify complete saver price
    And Session S1. I tap on Authunticated
    Then Session S1. I should be able to see Booking confirmed screen
    Then Session S1. I tap on Done

@IOS @HUB-26
Scenario: Booking the room as a new HUB Business account user
  Then Session S1. Clear data
  Given Session S1. Enter user details
  Given Session S1. Enter Card details
  Given Session S1. I am on HUB home page
  And I wait for 5 seconds
  Given Session S1. I tap on ChechAvailability
  Then Session S1. Select ArrivingDate as 16,March,2015
  Then Session S1. Select LeavingDate as 17,March,2015
  Then Session S1. Book Accessible room for 1 adult
  Then Session S1. I tap on Search
  Then Session S1. I should see Hub Flex Price and Hub Saver price
  Then Session S1. Book now for Hub flex Price
  And Session S1. I tap on Next
  And Session S1. Select Nationality United Kingdom
  And Session S1. I tap on Next
  And Session S1. Scroll down
  And Session S1. Scroll down
  And Session S1. Save 1 days Breakfast price for 1 persons
  And Session S1. I tap on Next
  And Session S1. Add charity Fund
  Then Session S1. I tap on Work
  And Session S1. Scroll down
  And Session S1. Enable purchases on account
  And Session S1. Scroll down
  And Session S1. Enter Business Account Email and Password
  And Session S1. I select Terms and Conditions
  Then Session S1. I tap on Finish
  Then Session S1. I should be able to see Booking confirmed screen
  Then Session S1. I tap on Done



