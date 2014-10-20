@EndtoEnd

Feature:Feature Button

  @Android @SingleDevice @EL-301
Scenario: Use all the options available on Filter Screen
    Given Session S1. I am on Car Finder Screen
    When Session S1. I tap on plus button
    And Session S1. I tap on filter button
    And Session S1. I set PriceRange as 3,500
    And Session S1. I set city as Any City 
    And Session S1. I set BodyType as Any Body Type
    And Session S1. I set FuelType as Any Fuel Type
    And Session S1. I set TransmissionType as Any Transmission Type
    And Session S1. I set EngineSize as Any Engine Size
    And Session S1. I set DealerType as Any Dealership
    And Session S1. I set WheelDriveType as Any Wheel Drive Type
    Then Session S1. Verify filter with text 3,500, Any City, Any Body Type, Any Fuel Type, Any Transmission Type, Any Dealership, Any Wheel Drive Type, Any Engine Size


