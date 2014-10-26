require 'watir-webdriver'

Then(/^Open CMS Webportal and grep information$/) do
   currDir=Dir.pwd
   prefs = {
       :download => {
           :prompt_for_download => false,
           :default_directory => currDir
       }
   }
   driver = Watir::Browser.new :chrome, :prefs => prefs
   driver.goto "http://eub-easyloans-staging.grppl.com/login"
   driver.window.maximize
   Watir::Wait.until { driver.text.include? 'enter your login details' }
   driver.text_field(:name => 'username').set 'user3'
   driver.text_field(:name => 'password').set 'pass3'
   driver.button(:type => 'submit').click
   Watir::Wait.until { driver.text.include? 'Log out' }
   driver.button(:id => 'prod-edit-dropd-2').click
   driver.link(:text => 'QR code').click
   sleep 10
   driver.windows.last.use
   driver.screenshot.save 'screen1.png'
   driver.windows.last.use.close
   /driver.button(:id => 'prod-edit-dropd-1').click
   driver.
   sleep 10
   driver.windows.last.use
   driver.screenshot.save 'screen2.png'
   driver.windows.last.use.close
   image_src = driver.find_element(:id => 'code')  /
end