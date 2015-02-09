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
def android_textgrep()
    arr=query("*", :text)
    act_arr=Array.new
    i=0
    while i<arr.length
      if arr[i]['error'] == nil
          act_arr.push(arr[i].to_s)
        else
      end
    i+=1
    end
    return act_arr
end
##Then Session S1. Display complete text on landing page
Then(/^Session ([\w\d]+). Display complete-text on ([\w ]+)$/) do |session,pageName|
  if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 5
  if pageName == "landing page"
      var = android_textgrep()
      scroll_down
      sleep 2
      var=var+android_textgrep()
      scroll_down
      sleep 2
      var=var+android_textgrep()
      scroll_down
      sleep 2
      var=var+android_textgrep()
      scroll_down
      sleep 2
      var=var+android_textgrep()
      scroll_down
      sleep 2
      var=var+android_textgrep()
      scroll_down
      sleep 2
      var=var+android_textgrep()
      scroll_down
      sleep 2
      var=var+android_textgrep()
      scroll_down
      sleep 2
      var=var+android_textgrep()
      var=var.uniq
      p_arry(var)
    elsif pageName == "RatePage"
    var = android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    var=var.uniq
    p_arry(var)
    elsif pageName == "Page"
    var = android_textgrep()
    p_arry(var)
    elsif pageName == "MoreDetailsPage"
    var = android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    scroll_down
    sleep 2
    var=var+android_textgrep()
    var=var.uniq
    p_arry(var)
    elsif pageName == "Screen"
    var = android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    scroll_down
    sleep 2
    var=var+android_textgrep()
    var=var.uniq
    p_arry(var)
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
    begin
    var = query("UILabel", :text)
    scroll("*", :down)
    sleep 2
    scroll("*", :down)
    sleep 2
    var=var+query("UILabel", :text)
    scroll("*", :down)
    sleep 2
    scroll("*", :down)
    sleep 2
    var=var+query("UILabel", :text)
    scroll("*", :down)
    sleep 2
    scroll("*", :down)
    sleep 2
    var=var+query("UILabel", :text)
    scroll("*", :down)
    sleep 2
    scroll("*", :down)
    sleep 2
    var=var+query("UILabel", :text)
    var=var.uniq
    p_arry(var)
    rescue => e
    puts "Fail due to exception: " + e.to_s
    end
    elsif pageName == "Page"
    var = query("UILabel", :text)
     p_arry(var)
    elsif pageName == "MoreDetailsPage"
     var = query("UILabel", :text)
     scroll("*", :down)
     sleep 2
     scroll("*", :down)
     sleep 2
     var=var+query("UILabel", :text)
     scroll("*", :down)
     sleep 2
     scroll("*", :down)
     sleep 2
     var=var+query("UILabel", :text)
     scroll("*", :down)
     sleep 2
     scroll("*", :down)
     sleep 2
     var=var+query("UILabel", :text)
     scroll("*", :down)
     sleep 2
     scroll("*", :down)
     sleep 2
     var=var+query("UILabel", :text)
     var=var.uniq
     p_arry(var)
     elsif pageName == "ApplyUpgradeScreen"
     var = query("UILabel", :text)
     scroll("*", :down)
     sleep 2
     scroll("*", :down)
     sleep 2
     var=var+query("UILabel", :text)
     var=var.uniq
     p_arry(var)
     elsif pageName == "Screen"
     var = query("UILabel", :text)
     scroll("*", :down)
     sleep 2
     scroll("*", :down)
     sleep 2
     var=var+query("UILabel", :text)
     scroll("*", :down)
     sleep 2
     scroll("*", :down)
     sleep 2
     var=var+query("UILabel", :text)
     scroll("*", :down)
     sleep 2
     scroll("*", :down)
     sleep 2
     var=var+query("UILabel", :text)
     scroll("*", :down)
     sleep 2
     scroll("*", :down)
     sleep 2
     var=var+query("UILabel", :text)
     var=var.uniq
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
        elsif ops == "Paying into your cash ISA"
        scroll('*', :down)
        sleep 2
        tap_mark "Paying into your cash ISA"
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
                                    ##countdown_type_toggle_button  ##countdown_timer_textview ##countdown_timer_type_textview
                                    days=query("* id:'text_view_day'", :text)[0].to_i
                                    sleep 3
                                    hours=query("* id:'text_view_hour'", :text)[0].to_i
                                    sleep 3
                                    mins=query("* id:'text_view_minute'", :text)[0].to_i
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
                                    start_mins = Time.now.utc.min
                                    act_mins = 60 - start_mins.to_i
                                    act_hours = 24-Time.now.utc.hour
                                    puts "Minutes should be: " + mins.to_s
                                    puts "Hours should be: " + hours.to_s
                                    if (mins == act_mins || mins == act_mins-1)  && (hours == act_hours || hours == act_hours -1)
                                    puts "Pass"
                                    
                                    else
                                    fail("Minutes/Hours not correct")
                                    end
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

##Then Session S1. Click information button
Then(/^Session ([\w\d]+). Click ([\w ,'&?]+)$/) do |session,ops|
        if $Configuration[session+"DeviceType"] == "Android"
            set_default_device($session[session])
            sleep 3
            if ops == "iButton"
                touch(query("ImageButton")[0])
            else
            scroll_to("* text:'#{ops}'")
            tap_mark "#{ops.to_s}"
            end
         else
            sleep 3
            if ops == "iButton"
                touch(query("UIButton")[4])
            else
            i=0
            while(i<20)
                if element_exists("* text:'#{ops}'")
                    tap_mark "#{ops.to_s}"
                break
                else
                    scroll("*", :down)
                    sleep 2
                i+=1
               end
            end
            end
    end
end