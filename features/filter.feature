@EndtoEnd

Feature:Feature Button

  @Android @SingleDevice @EL-301
Scenario:
    Given Session S1. I am on Car Finder Screen
    When Session S1. I tap on plus button
    And Session S1. I tap on filter button
    And Session S1. I set PriceRange as 5000
    And Session S1. I set city as Any City
    And Session S1. I set BodyType as Hatchback
    And Session S1. Scroll down
    And Session S1. I set FuelType as Diesel
    And Session S1. Scroll down
    And Session S1. I set TransmissionType as Automatic
    And Session S1. Scroll down
    And Session S1. Scroll down
    And Session S1. I set DealerType as Car Dealer
    And Session S1. Scroll down
    And Session S1. I set WheelDriveType as Front
    Then Session S1. I press back button