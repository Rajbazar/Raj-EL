Feature: Interest Calculator View 
In Order to see how much Interest I get 
As a mobile app user 
So that I can deposit minimum to maximun ammount


@Android @ISA-00
Scenario: Calculator Sample
  Then Session S1. I tap on RightMenu
  Then Session S1. I tap on Calculator
  Then Session S1. Select investment amount
  Then Session S1. Display Interest rate
  Then Session S1. Display Interest earned
  Then Session S1. Display tax saved


@Android @ISA-20
Scenario: Calculator Sample
  Then Session S1. I tap on RightMenu
  Then Session S1. I tap on Calculator
  Then Session S1. Select investment amount
  Then Session S1. Display Interest rate
  Then Session S1. Display Interest earned
  Then Session S1. Display tax saved


@IOS @Android @ISA-21
Scenario: Interest for Max deposit value
Given I am on the landing page
 When I tap on calculator
 Then I should see the Interest Calculator 
  And I enter the Maximum amount 
 Then I should see the Interest Calculated for Maximum ammount 
  And I should see how much tax i saved for the Max deposit

@IOS @Android @ISA-22
 Scenario: Interest for Minimum deposit value
Given I am on the landing page
 When I tap on calculator
 Then I should see the Interest Calculator 
  And I enter the Mainimum amount 
 Then I should see the Calculated Interest for Minimum ammount
  And I should see how much tax i saved for the Minimum deposit


@IOS @Android @ISA-23
 Scenario: To check interest rate on various deposit ammount
Given I am on the landing page
 When I tap on calculator
  And I change the deposit value
 Then I should see the changed Interest value 
  And I should see the changed tax value 



 


