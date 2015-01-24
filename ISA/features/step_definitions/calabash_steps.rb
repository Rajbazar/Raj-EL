if $Configuration["S1DeviceType"] == "IOS" || $Configuration["S2DeviceType"] == "IOS"
  require 'calabash-cucumber/calabash_steps'
else
  require 'calabash-android/calabash_steps'
end

def p_arry(a)
    i=0
    while i<a.length
        puts a[i].to_s + "\n"
        i+=1
    end
end
##Then Session S1. Display complete text on landing page
Then(/^Session ([\w\d]+). Display complete-text on ([\w ]+)$/) do |session,pageName|
  if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 5
  if pageName == "landing page"
    var=query("*", :text)[7].to_s
    puts var
    a=query("* id:'tv_title_product'", :text)
    scroll_down
    a=a+query("* id:'tv_title_product'", :text)
    a=a.uniq
    puts a
    elsif pageName == "RatePage"
    elsif pageName == "Page"
   end
  else
    sleep 5
    if pageName == "landing page"
    var = query("UILabel", :text)
    scroll("*", :down)
    sleep 2
    scroll("*", :down)
    sleep 2
    var=var+query("UILabel", :text)
    var=var.uniq
    p_arry(var)
    elsif pageName == "RatePage"
    var = query("UILabel", :text)
    p_arry(var)
    elsif pageName == "Page"
    var = query("UILabel", :text)
     p_arry(var)
    end
 end
end

Then(/^Session ([\w\d]+). I tap on ([\w ,'&?]+)$/) do |session,ops|
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
        tap_mark 'back arrow'
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

Then(/^Session ([\w\d]+). Scroll ([\w ]+)$/) do |session,ops|
     if $Configuration[session+"DeviceType"] == "Android"
         set_default_device($session[session])
         sleep 3
         if ops == "up"
            scroll_up
         else
            scroll_down
        end
     else
         sleep 3
         if ops == "up"
            scroll('*',:up)
         else
             scroll('*',:down)
        end
    end
end

Then(/^Session ([\w\d]+). Verify Clock from 5th April$/) do |session|
      if $Configuration[session+"DeviceType"] == "Android"
          set_default_device($session[session])
          sleep 3
      else
          sleep 3
          arr=query('UILabel',:text)
          i=0
          while i<arr.length
             if arr[i] == "Countdown Clock"
                days=query('UILabel',:text)[i+1].to_s
                tap_mark "timer icon iOS"
                sleep 3
                hours=query('UILabel',:text)[i+1].to_s
                tap_mark "timer icon iOS"
                sleep 3
                mins=query('UILabel',:text)[i+1].to_s
                days=days.gsub(/\nDays/,"").to_i
                hours=hours.gsub(/Hours/,"").to_i
                mins=mins.gsub(/Minutes/,"").to_i
                break
            end
          i+=1
          end
          a=Time.now
          start_date = Date.parse "2015-04-05"
          end_date = Date.parse a.to_s
          act_days = (start_date - end_date).to_i
          puts "Days should be: " + act_days.to_s
          if days == act_days
            puts "Pass"
          else
            fail("Days not correct")
          end
          start_mins = Time.parse "2015-04-06"
          end_mins = Time.parse a.to_s
          act_mins = ((start_mins - end_mins)/60).to_i
          act_hours = (act_mins/60).to_i
          puts "Minutes should be: " + act_mins.to_s
          puts "Hours should be: " + act_hours.to_s
          if mins == act_mins && hours == act_hours
               puts "Pass"
               
          else
               fail("Minutes/Hours not correct")
          end
      end
end