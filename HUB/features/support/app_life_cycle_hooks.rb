if $Configuration["S1DeviceType"] == "IOS" || $Configuration["S2DeviceType"] == "IOS"
Before do |scenario|
 begin
  tap_mark "icon_navbar_menu"
  tap_mark "hub by Premier Inn"
rescue
end
end
puts "\n\nKindly enable debug button manually when app is launched(you have 30secs). \n\nThanks! \n\n\n"
sleep 10
Before do ('@HUB-01')
  ios_connect("S1")
  start_test_server_in_background
  sleep 30
end
else
require 'calabash-android/management/adb'
require 'calabash-android/operations'
#require 'calabash-android/management/app_installation'
#require 'calabash-android/management/app_installation'

Before do |scenario|
 begin
set_default_device($session["S1"])
  shutdown_test_server
  start_test_server_in_background
/set_default_device($session["S2"])
  shutdown_test_server
  start_test_server_in_background/
 rescue
end
end

After do |scenario|

 if scenario.failed?
    screenshot_embed
  end
  /set_default_device($session["S1"])	
  shutdown_test_server
   set_default_device($session["S2"])	
  shutdown_test_server/
end
end


