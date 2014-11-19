Feature: Booking Feature
   As a HUB app user
   I want to book a room


  @Android @HUB-21
Scenario: Tapping elements throught the App
 Given Session S1. I tap on ChechAvailability
 Then Session S1. Select ArrivingDate as 21,March,2015
 Then Session S1. Select LeavingDate as 24,March,2015
 Then Session S1. Book Accessible room for 2 adults
 Then Session S1. I tap on Search
 Then Session S1. I should see Hub Flex Price and Hub Saver price
