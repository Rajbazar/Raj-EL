@EndtoEnd

Feature:Feature Button

  @Android @SingleDevice @EL-301
Scenario: Use all the options available on Filter Screen
    Given Session S1. I am on Car Finder Screen
    When Session S1. I tap on plus button
    And Session S1. I tap on filter button
    And Session S1. I set PriceRange as 9,000
    And Session S1. I set city as Any City
    And Session S1. I set BodyType as Hatchback
    And Session S1. I set FuelType as Diesel
    And Session S1. I set TransmissionType as Automatic
    And Session S1. I set EngineSize as 2L - 2.9L
    And Session S1. I set DealerType as Car dealer
    And Session S1. I set WheelDriveType as Front
    Then Session S1. Verify filter with text 9,000, Any City, Hatchback, Diesel, Automatic, Car dealer, Front, 2L - 2.9L


