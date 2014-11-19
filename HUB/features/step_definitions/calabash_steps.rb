require 'calabash-android/calabash_steps'

##Given Session S1. I tap on LeftMenu
Then(/^Session ([\w\d]+). I tap on ([\w ]+)$/) do |session,ops|
  set_default_device($session[session])
  sleep 5
  if ops == "LeftMenu"
  	tap_mark $id_config["left_menu"]
  elsif ops == "myStay"
  	tap_mark $id_config["left_menu_mystay"]	
  elsif ops == "myBookings"
  	tap_mark $id_config["left_menu_mybookings"]	
  elsif ops == "myAccount"
  	tap_mark $id_config["left_menu_myaccount"]
  elsif ops == "info"
    scroll_down
    tap_mark $id_config["left_menu_info"] 
  elsif ops == "debug"
    scroll_down
    tap_mark $id_config["left_menu_debug"] 
   elsif ops == "ChechAvailability"
    tap_mark $id_config["ChechAvailability"]  
    elsif ops == "Search"
     tap_mark $id_config["room_search"]                                        							
  else
  	puts "ID not Found"
  end
 end 	

 ##Then Session S1. Display AppVersion
Then(/^Session ([\w\d]+). Display ([\w]+)$/) do |session,ops|
 	set_default_device($session[session])
  	sleep 3
  	if ops == "AppVersion"
  		puts query("* id:'"+$id_config["left_menu_version"]+"'", :text)[0]
  	else
  		puts "ID not Found"
	end
end
