@EndtoEnd

Feature: Scan & Shop Verification


  @Android @SingleDevice @EL-601
    Scenario: Grep information from QR Code
     Then Open CMS Webportal and grep information 


  @Android @SingleDevice @EL-602
  	 Scenario: Apply Loan from basket
  	 Given Session S1. Create profile
      When Session S1. I tap on LeftMenu
       And Session S1. I tap on Scan & Shop
       And Session S1. I tap on Basket
  	 Given Session S1. Verify that basket has atleast 3 products
  	  Then Session S1. Select product and apply Loan
  	   And Session S1. Display reference code
  	  Then Session S1. I tap on DONE
