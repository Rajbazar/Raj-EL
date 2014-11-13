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
   j=1
   20.step(1, -1) { |i|
     if driver.button(:id => "prod-edit-dropd-#{i}").exists?
       driver.button(:id => "prod-edit-dropd-#{i}").click
       driver.link(:xpath => "(//a[contains(text(),'QR code')])[#{j}]").click
       sleep 5
       driver.windows.last.use
       driver.screenshot.save "qr#{j}.png"
       driver.windows.last.use.close
       j+=1
     end
   }
  driver.link(:id => 'log-out-link').click
  sleep 5
  driver.goto "http://zxing.org/w/decode.jspx"
  Watir::Wait.until { driver.text.include? 'upload a file' }
  a=Dir.glob("qr*.png")
  code_eval=Hash.new
  i=1
   while i <= a.length
    driver.file_field(:name => "f").value = "#{currDir}/qr#{i}.png"
    driver.button(:xpath => "(//input[@type='submit'])[2]").click
    code_eval["qr#{i}.png"]= driver.table[4][1].text
    driver.back
    File.delete("#{currDir}/qr#{i}.png")
    sleep 3
    i+=1
   end
   driver.close
   puts code_eval
end