require 'calabash-android/calabash_steps'

##Given Session S1. I tap on LeftMenu
Then(/^Session ([\w\d]+). I tap on ([\w ,'&]+)$/) do |session,ops|
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
    begin
    scroll_down
    tap_mark $id_config["left_menu_info"]
    rescue
    end
    begin
      tap_mark "#{ops.to_s}"
    rescue
    end
  elsif ops == "debug"
    scroll_down
    scroll_down
    tap_mark $id_config["left_menu_debug"] 
   elsif ops == "ChechAvailability"
    tap_mark $id_config["ChechAvailability"]  
    elsif ops == "Search"
     tap_mark $id_config["room_search"]
    elsif ops == "Authunticated"
     scroll_down
     scroll_down
     arr=query("WebView css:'*'")
     i=0
     while i < arr.length
      a=query("WebView css:'*'")[i]
      if a["value"] == "Authenticated"
        touch(query("WebView css:'*'")[i])
        break
      else
        i+=1
      end  
     end
     sleep 15
    elsif ops == "backButton"
      sleep 3
      tap_mark $id_config["backButton"]
    elsif ops == "OK Iam happy with this"
      wait_for_elements_exist( ["* id:'"+$id_config["happy_button"]+"'"], :timeout => 20)
      tap_mark $id_config["happy_button"]
    elsif ops == "DontBotherWifiCheck"
      sleep 2
      tap_mark $id_config["wifi_check"]
    elsif ops == "lightCloseButton"
      tap_mark $id_config["light_close"]
    elsif ops == "tempCloseButton"
      tap_mark $id_config["temp_close"]
    elsif ops == "SendFeedback"
      tap_mark $id_config["feedback"]
    elsif ops == "tvCloseButton"
      tap_mark $id_config["tv_close"]
  else
    tap_mark "#{ops.to_s}"
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

Then(/^Session ([\w\d]+). Scroll ([\w]+)$/) do |session,operation|
  set_default_device($session[session])
  sleep 3
  if operation == "down"
    scroll_down
  elsif operation == "up"
    scroll_up
  end
end

##Then Session S1. I am on HUB home page
Then(/^Session ([\w\d]+). I am on HUB home page$/) do |session|
  set_default_device($session[session])
  sleep 3
  tap_mark $id_config["left_menu"]
  sleep 2
  tap_mark "hub by Premier Inn"
end