if $Configuration["S1DeviceType"] == "IOS" || $Configuration["S2DeviceType"] == "IOS"
  require 'calabash-cucumber/calabash_steps'
else
  require 'calabash-android/calabash_steps'
end

##Then Session S1. Display complete text on landing page
Then(/^Session ([\w\d]+). Display complete-text on landing page$/) do |session|
  if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 5
    var=query("*", :text)[7].to_s
    puts var
    a=query("* id:'tv_title_product'", :text)
    scroll_down
    a=a+query("* id:'tv_title_product'", :text)
    a=a.uniq
    puts a
  else
    sleep 5
    var = query("UILabel", :text)
    scroll("*", :down)
    sleep 2
    scroll("*", :down)
    sleep 2
    var=var+query("UILabel", :text)
    var=var.uniq
    puts var
 end
end

Then(/^Session ([\w\d]+). I tap on ([\w ,'&]+)$/) do |session,ops|
  if $Configuration[session+"DeviceType"] == "Android"
    set_default_device($session[session])
    sleep 3
    if ops == "RightMenu"
      touch(query("android.support.v7.widget.ActionMenuView")[0])
    elsif ops == "HardBackButton"
      sleep 2
      system("#{default_device.adb_command} shell input keyevent KEYCODE_BACK")
    else
      sleep 2
      tap_mark "#{ops.to_s}"
    end
  else
        sleep 3
        if ops == "RightMenu"
        puts "No Right menu for iOS"
        elsif ops == "Settings"
        puts "Not implemented for iOS"
        elsif ops == "Calculator"
        puts "Not implemented for iOS"
        elsif ops == "HardBackButton"
        begin
        sleep 2
        tap_mark 'Back'
        rescue
        end
        elsif ops == 'Transfer'
        sleep 2
        tap_mark 'Transfer In'
        else
        sleep 2
        tap_mark "#{ops.to_s}"
    end
    end
end