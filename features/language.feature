@EndtoEnd
Feature: Choosing the Language when app launch for first time
   As a first time app user
   I want to choose the language
   So that I can able to use the app 

     

@Android @LAN-01 @SingleDevice
Scenario: Select Language as English
     Given Session S1. I tap on English
      When Session S1. I tap on DONE
       And I wait for 10 seconds
     Then Session S1. I tap on LeftMenu


@Android @LAN-02 @MultipleDevice
Scenario: Select Language as English
     Given Session S1. I tap on English 
     Given Session S2. I tap on English
      When Session S1. I tap on DONE
      When Session S2. I tap on DONE
       And I wait for 10 seconds
     Then Session S1. I tap on LeftMenu
     Then Session S2. I tap on LeftMenu 
     

@Android @LAN-03 @SingleDevice
Scenario: Select Language as Russian
     Given Session S1. I tap on Russian 
      When Session S1. I tap on DONE
       And I wait for 10 seconds
     Then Session S1. I tap on LeftMenu         


@Android @LAN-04 @MultipleDevice
Scenario: Select Language as Russian
     Given Session S1. I tap on Russian 
     Given Session S2. I tap on Russian 
      And I wait for 10 seconds  
     When Session S1. I tap on DONE
     When Session S2. I tap on DONE
      And I wait for 10 seconds
     Then Session S1. I tap on LeftMenu
     Then Session S2. I tap on LeftMenu


@Android @LAN-05 @SingleDevice
Scenario: Select Language as Kazakh
     Given Session S1. I tap on Kazakh
      When Session S1. I tap on DONE
       And I wait for 10 seconds
     Then Session S1. I tap on LeftMenu     


@Android @LAN-06 @MultipleDevice
Scenario: Select Language as Kazakh
     Given Session S1. I tap on Kazakh 
     Given Session S2. I tap on Kazakh
      And I wait for 10 seconds  
     When Session S1. I tap on DONE
     When Session S2. I tap on DONE
      And I wait for 10 seconds
     Then Session S1. I tap on LeftMenu
     Then Session S2. I tap on LeftMenu


