## Then Session S1. Select ArrivingDate as 21,March,2015
Then(/^Session ([\w\d]+). Select ([\w]+) as ([\w\d,]+)$/) do |session,action,date|
  if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
    sleep 3
    def date_select_arrive(str)
      a=str
      a=a.split(",")
      date_no=a[0].to_s
      date_month=a[1].to_s
      date_year=a[2].to_s
      month_year=date_month + " " + date_year
      i=0
      if element_exists("* text:'"+month_year+"'")
        curr_date=Time.new.day
        if date_no.to_i >= curr_date
          touch(query("* text:'"+date_no+"' * enabled:'true'")[0])
        else
          scroll_down
          touch(query("* text:'"+date_no+"' * enabled:'true'")[0])
        end
      else
      while (i<20)
        if element_exists("* text:'"+month_year+"'")
          /scroll_down/
          break
        else
          scroll_down
        end
        i+=1  
      end
      touch(query("* text:'"+date_no+"' * enabled:'true'")[0])
      end
     end
    def date_select_leave(str)
      a=str
      a=a.split(",")
      date_no=a[0].to_s
      touch(query("* text:'"+date_no+"' * enabled:'true'")[0])
    end
    if action == "ArrivingDate"
      date_select_arrive(date.to_s)
    else
      date_select_leave(date.to_s)
    end
  else
    ##IOS Code starts
    ios_connect(session)
    sleep 3
def date_select_arrive(str)
    a=str
    a=a.split(",")
    date_no=a[0].to_s
    date_month=a[1].to_s
    date_year=a[2].to_s
    month_year=date_month + " " + date_year
    i=0
    if element_exists("* text:'"+month_year+"'")
            touch(query("* text:'"+date_no+"'")[0])
            if element_exists("* text:'Date cannot be in the past'")
              puts "Past date selected, change date in features"
              else
            end
        else
        while element_does_not_exist("* text:'"+month_year+"'")
                scroll("UICollectionView", :right)
                sleep 2
        end
        if query("* text:'"+date_no+"'").count > 1
        touch(query("* text:'"+date_no+"'")[1])
        else
        touch(query("* text:'"+date_no+"'")[0])
        end
        if element_exists("* text:'Date cannot be in the past'")
            puts "Past date selected, change date in features"
        end
    end
end
def date_select_leave(str)
    a=str
    a=a.split(",")
    date_no=a[0].to_s
    if query("* text:'"+date_no+"'").count > 1
        touch(query("* text:'"+date_no+"'")[1])
        else
        touch(query("* text:'"+date_no+"'")[0])
    end
end
if action == "ArrivingDate"
    date_select_arrive(date.to_s)
    else
    date_select_leave(date.to_s)
    end
  end
end


Then(/^Session ([\w\d]+). Book now for ([\w ]+)$/) do |session,priceType|
if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 3
  if priceType == "Hub flex Price"
    price_val=query("* id:'txt_rate_price'",:text)[0]
    $flexi_price=price_val.gsub(/£/,'').to_f
    touch(query("* id:'"+$id_config["book_now"]+"'")[0])
  else
    price_val=query("* id:'txt_rate_price'",:text)[1]
    $saver_price=price_val.gsub(/£/,'').to_f
    touch(query("* id:'"+$id_config["book_now"]+"'")[1])
  end
  else
  ##IOS Code starts
  ios_connect(session)
  sleep 3
  if priceType == "Hub flex Price"
      price_val=query('label', :text)[8]
      $flexi_price=price_val.gsub(/£/,'').to_f
      touch(query("* text:'Book now'")[0])
      else
      price_val=query('label', :text)[12].to_s
      $saver_price=price_val.gsub(/£/,'').to_f
      touch(query("* text:'Book now'")[1])
  end
  end
end


##Given Session S1. Enter user details
Then(/^Session ([\w\d]+). Enter user details$/) do |session|
  if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 3
  tap_mark $id_config["left_menu"]
  sleep 2
  tap_mark $id_config["left_menu_myaccount"]
  sleep 5
  query("* id:'"+$id_config["username_field"]+"'", {:setText => ""})
  query("* id:'"+$id_config["username_field"]+"'", {:setText => "#{$Configuration["UserEmail"]}"})
  query("* id:'"+$id_config["password_field"]+"'", {:setText => ""})
  query("* id:'"+$id_config["password_field"]+"'", {:setText => "#{$Configuration["UserPassword"]}"})
  tap_mark  $id_config["login_button"]
  sleep 5
  tap_mark "Yes"
  tap_mark "#{$id_config["info_mydetails"]}"
  sleep 2
  tap_mark "#{$id_config["user_title"]}"
  sleep 2
  i=0
  while (i < 5)
    if element_exists("* text:'#{$Configuration["UserTitle"]}'")
      tap_mark "#{$Configuration["UserTitle"]}"
      break
    else
      scroll_down
    end
    i+=1
  end

  sleep 2
  query("* id:'"+$id_config["user_firstname"]+"'", {:setText => ""})
  query("* id:'"+$id_config["user_firstname"]+"'", {:setText => "#{$Configuration["UserName"]}"})
  query("* id:'"+$id_config["user_lastname"]+"'", {:setText => ""})
  query("* id:'"+$id_config["user_lastname"]+"'", {:setText => "#{$Configuration["Userlastname"]}"})
  query("* id:'"+$id_config["user_mobile"]+"'", {:setText => ""})
  query("* id:'"+$id_config["user_mobile"]+"'", {:setText => "#{$Configuration["UserNumber"]}"})
  scroll_down
  scroll_down
  sleep 5
  tap_mark "#{$id_config["user_postcode"]}"
  begin
  tap_mark 'search_close_btn'
  rescue
  end
  sleep 5
  system("#{default_device.adb_command} shell input keyevent KEYCODE_BACK")
  sleep 2
  system("#{default_device.adb_command} shell input keyevent KEYCODE_BACK")
  sleep 5
  tap_mark "#{$id_config["user_postcode"]}"
  sleep 5
  query("* id:'"+$id_config["user_postcode"]+"'", {:setText => ""})
  query("* id:'"+$id_config["user_postcode"]+"'", {:setText => "#{$Configuration["UserPincode"]}"})
  sleep 5
  system("#{default_device.adb_command} shell input keyevent KEYCODE_BACK")
  sleep 2
  query("* id:'"+$id_config["user_addressline1"]+"'", {:setText => ""})
  query("* id:'"+$id_config["user_addressline1"]+"'", {:setText => "#{$Configuration["UserFullAddress1"]}"})
  query("* id:'"+$id_config["user_addressline2"]+"'", {:setText => ""})
  query("* id:'"+$id_config["user_addressline2"]+"'", {:setText => "#{$Configuration["UserFullAddress2"]}"})
  query("* id:'"+$id_config["user_addressline3"]+"'", {:setText => ""})
  query("* id:'"+$id_config["user_addressline3"]+"'", {:setText => "#{$Configuration["UserFullAddress3"]}"})
  query("* id:'"+$id_config["user_addressline3"]+"'", {:setText => ""})
  query("* id:'"+$id_config["user_addressline3"]+"'", {:setText => "#{$Configuration["UserFullAddress3"]}"})
  tap_mark $id_config["country"]
  i=0
  while (i < 20)
    if element_exists("* text:'#{$Configuration["UserCountry"]}'")
      tap_mark "#{$Configuration["UserCountry"]}"
      break
    else
      scroll_down
    end
    i+=1
  end
  tap_mark 'Save'
  sleep 5
else
  ##IOS Code starts
  ios_connect(session)
  sleep 3
  tap_mark "icon_navbar_menu"
  sleep 2
  tap_mark "my account"
  sleep 5
  clear_text("textField")
  tap_mark "Email"
  keyboard_enter_text "#{$Configuration["UserEmail"]}"
  tap_mark "Password"
  keyboard_enter_text "#{$Configuration["UserPassword"]}"
  tap_mark 'Log in'
  sleep 5
  begin
  tap_mark "OK"
  rescue
  end
  tap_mark 'My details'
  sleep 2
  clear_text("textField")
  sleep 2
  tap_mark "Title"
  tap_mark "#{$Configuration["UserTitle"]}"
  sleep 2
  tap_mark "First name"
  keyboard_enter_text "#{$Configuration["UserName"]}"
  tap_mark "Last name"
  keyboard_enter_text "#{$Configuration["Userlastname"]}"
  tap_mark "Mobile number"
  keyboard_enter_text "#{$Configuration["UserNumber"]}"
  scroll("*", :down)
  sleep 2
  tap_mark "Postcode"
  sleep 5
  begin
  tap_mark "Cancel"
  rescue
  end
  tap_mark "Postcode"
  sleep 5
  keyboard_enter_text "#{$Configuration["UserPincode"]}"
  sleep 2
  scroll("*", :down)
  sleep 2
  tap_mark "Address line 1"
  keyboard_enter_text "#{$Configuration["UserFullAddress1"]}"
  sleep 2
  tap_mark "Address line 2"
  keyboard_enter_text "#{$Configuration["UserFullAddress2"]}"
  tap_mark 'Country'
  i=0
  while (i < 80)
    if element_exists("* text:'#{$Configuration["UserCountry"]}'")
      tap_mark "#{$Configuration["UserCountry"]}"
      break
    else
      scroll("UITableViewCellScrollView", :down)
    end
    i+=1
  end
  tap_mark 'Save'
  sleep 5
end
end

Then(/^Session ([\w\d]+). Enter Card details$/) do |session|
  if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 3
  tap_mark $id_config["info_cardetails"]
  sleep 3
  tap_mark $id_config["card_type"]
  sleep 2
  i=0
  while (i < 5)
    if element_exists("* text:'#{$Configuration["CardType"]}'")
      tap_mark "#{$Configuration["CardType"]}"
      break
    else
      scroll_down
    end
    i+=1
  end
  query("* id:'"+$id_config["card_number"]+"'", {:setText => ""})
  query("* id:'"+$id_config["card_number"]+"'", {:setText => "#{$Configuration["CardNumber"]}"})
  query("* id:'"+$id_config["card_fullname"]+"'", {:setText => ""})
  query("* id:'"+$id_config["card_fullname"]+"'", {:setText => "#{$Configuration["CardholderName"]}"})
  tap_mark $id_config["card_endate"]
  sleep 2
  var=query("* id:'year'").to_s
  exp1=/\"center_x\"=>(\d+),/
  exp2=/\"center_y\"=>(\d+),/
  m=exp1.match(var)
  m2=exp2.match(var)
  x_coord=m.captures[0].to_s
  y_coord=m2.captures[0].to_s
  system("#{default_device.adb_command} shell input touchscreen tap #{x_coord} #{y_coord}")
  system("#{default_device.adb_command} shell input text #{$Configuration["CardEndDate"].split[1].to_s}")
  system("#{default_device.adb_command} shell input keyevent KEYCODE_BACK")
  system("#{default_device.adb_command} shell input touchscreen tap #{x_coord} #{y_coord}")
  system("#{default_device.adb_command} shell input keyevent KEYCODE_BACK")
  sleep 3
  var1=query("* id:'month'").to_s
  m3=exp1.match(var1)
  m4=exp2.match(var1)
  x_coord1=m3.captures[0].to_s
  y_coord1=m4.captures[0].to_s
  system("#{default_device.adb_command} shell input touchscreen tap #{x_coord1} #{y_coord1}")
  system("#{default_device.adb_command} shell input text #{$Configuration["CardEndDate"].split[0].to_s}")
  system("#{default_device.adb_command} shell input keyevent KEYCODE_BACK")
  system("#{default_device.adb_command} shell input touchscreen tap #{x_coord} #{y_coord}")
  system("#{default_device.adb_command} shell input keyevent KEYCODE_BACK")
  tap_mark 'Confirm'
  sleep 3
  tap_mark 'Save'
  sleep 10
else
  ###iOS Code for Card Payment ###
  ios_connect(session)
  begin
  tap_mark "OK"
  rescue
  end
  sleep 3
  tap_mark 'My payment card'
  sleep 3
  clear_text("textField")
  tap_mark "Card type"
  ##Only to be used for Amex Cards
  /while element_does_not_exist("* text:'#{$Configuration["CardType"]}'")
      scroll("UIPickerTableView", :down)
  end/
  tap_mark "#{$Configuration["CardType"]}"
  sleep 2
  tap_mark "Card number"
  keyboard_enter_text "#{$Configuration["CardNumber"]}"
  tap_mark "Cardholder name"
  keyboard_enter_text "#{$Configuration["CardholderName"]}"
  scroll("*", :down)
  sleep 3
  tap_mark "End date"
  a="#{$Configuration["CardEndDate"]}"
  a_year_int=a.split[1].to_i
  a_month_int=a.split[0].to_i
  curr_year=Time.now.year
  curr_month=Time.now.month
  i=0
  while (i<20)
  if element_exists("* text:'"+a_year_int.to_s+"'")
    tap_mark a_year_int.to_s
    break
  else
    tap_mark curr_year.to_s
    curr_year+=1
    i+=1
  end
end
  j=0
  while (j<20)
  if element_exists("* text:'"+"0"+a_month_int.to_s+"'") && a_month_int < 10
    tap_mark "0"+a_month_int.to_s
    break
  elsif element_exists("* text:'"+a_month_int.to_s+"'")
      tap_mark a_month_int.to_s
  else
    if curr_month < 10
    tap_mark "0"+curr_month.to_s
    else
    tap_mark curr_month.to_s
    end
    if curr_month == 12
      curr_month=11
    elsif curr_month == 0
      curr_month=1  
    else
    curr_month-=1
    end
    j+=1
  end
end
  sleep 3
  tap_mark 'Save'
  sleep 10
end
end


## Then Session S1. Book Accessible room for 2 adults
Then(/^Session ([\w\d]+). Book ([\w]+) room for ([\w\d &]+)$/) do |session,roomType,guest|
if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
    sleep 3
    if roomType == "Standard"
      tap_mark $id_config["standard"]
    else
      tap_mark $id_config["accessible"]
    end  
       
    if guest == "1 adult"
      tap_mark $id_config["one_adult"]
    elsif guest == "2 adults"
      tap_mark $id_config["two_adults"]
    else
      tap_mark $id_config["adult_and_child"] 
    end
    else
    ##IOS Code starts
    ios_connect(session)
    sleep 3
    if roomType == "Standard"
        tap_mark "Standard"
        else
        tap_mark "Accessible"
    end
    
    if guest == "1 adult"
        tap_mark "1 adult"
        elsif guest == "2 adults"
        tap_mark "2 adults"
        else
        tap_mark '1 adult &  1 child'
    end
    end
end

##Then Session S1. Display Hub Flex Price and Hub Saver priced
Then(/^Session ([\w\d]+). I should see Hub Flex Price and Hub Saver price$/) do |session|
if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
    sleep 20  
    puts "Hub Flex Price: " + query("* id:'"+$id_config["price_rate"]+"'", :text)[0].to_s
    puts "Hub Saver Price: " + query("* id:'"+$id_config["price_rate"]+"'", :text)[1].to_s
    else
    ##IOS Code starts
    ios_connect(session)
    sleep 5
    puts "Hub Flex Price: " + query('label', :text)[8].to_s
    puts "Hub Saver Price: " + query('label', :text)[12].to_s
    end
end


##And Session S1. Enter second guest details
Then(/^Session ([\w\d]+). Enter second guest details$/) do |session|
if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 3
  i=0
  while (i < 5)
  if element_exists("* text:'Second guest details'")
    scroll_down
    break
  else
    scroll_down
  end
  end
  tap_mark "#{$id_config["second_guest_title"]}"
  sleep 2
  i=0
  while (i < 5)
    if element_exists("* text:'#{$Configuration["SecondGuestTitle"]}'")
      tap_mark "#{$Configuration["SecondGuestTitle"]}"
      break
    else
      scroll_down
    end
    i+=1
  end
  query("* id:'"+$id_config["second_guest_firstname"]+"'", {:setText => ""})
  query("* id:'"+$id_config["second_guest_firstname"]+"'", {:setText => "#{$Configuration["SecondGuestName"]}"})
  query("* id:'"+$id_config["second_guest_lastname"]+"'", {:setText => ""})
  query("* id:'"+$id_config["second_guest_lastname"]+"'", {:setText => "#{$Configuration["SecondGuestlastname"]}"})
  else
  ##IOS Code starts
  ios_connect(session)
  sleep 3
  scroll("*",:down)
  sleep 3
  tap_mark 'Title'
  sleep 2
  tap_mark "#{$Configuration["SecondGuestTitle"]}"
  tap_mark 'Done'
  sleep 2
  touch(query("* text:'First name'")[1])
  wait_for_keyboard
  keyboard_enter_text "#{$Configuration["SecondGuestName"]}"
  tap_mark 'Done'
  touch(query("* text:'Last name'")[1])
  wait_for_keyboard
  keyboard_enter_text "#{$Configuration["SecondGuestlastname"]}"
  tap_mark 'Done'
end
end


##And Session S1. Select Nationality as United Kingdom
Then(/^Session ([\w\d]+). Select Nationality ([\w ]+)$/) do |session, nationality|
if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 3
  tap_mark $id_config["mainguest_nationality"]
  sleep 3
  i=0
  while (i < 20)
    if element_exists("* {text CONTAINS '#{nationality.to_s}'}")
      touch("* {text CONTAINS '#{nationality.to_s}'}")
      break
    else
      scroll_down
    end
    i+=1
  end
  else
  ##IOS Code starts
  ios_connect(session)
  sleep 3
  tap_mark 'Nationality'
  while element_does_not_exist("* text:'#{$Configuration["UserCountry"]}'")
     scroll("UITableViewCellScrollView", :down)
  end
  touch(("* text:'#{$Configuration["UserCountry"]}'"))
  tap_mark 'Done'
  end
end

##And Session S1. Add charity Fund as £1.00
Then(/^Session ([\w\d]+). Add charity Fund$/) do |session|
 if $Configuration[session+"DeviceType"] == "Android"
 set_default_device($session[session])
  sleep 3
  tap_mark "#{$id_config["charity_fund"]}"
  begin
  $flexi_price+=1.0
  rescue
  end
  begin
  $saver_price+=1.0
  rescue
  end
  else
  ##IOS Code starts
  ios_connect(session)
  sleep 3
  tap_mark "£1.00"
  begin
      $flexi_price+=1.0
      rescue
  end
  begin
      $saver_price+=1.0
      rescue
  end
  end
end

##And Session S1. Add Transaction fee
Then(/^Session ([\w\d]+). Add Transaction fee$/) do |session|
  set_default_device($session[session])
  sleep 3
  begin
    $flexi_price+=2.0
  rescue
  end
  begin
    $saver_price+=2.0
  rescue
  end
end

##And Session S1. I select Terms and Conditions
Then(/^Session ([\w\d]+). I select Terms and Conditions$/) do |session|
if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 3
  scroll_down
  scroll_down
  tap_mark "#{$id_config["check_termsconditions"]}"
  scroll_up
  scroll_up
  else
  ##IOS Code starts
  ios_connect(session)
  sleep 3
  scroll("*", :down)
  sleep 3
  tap_mark "icon_tickbox_unticked"
  scroll("*", :up)
  end
end


##And Session S1. I fill Security code
Then(/^Session ([\w\d]+). I fill Security code$/) do |session|
if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 3
  tap_mark "#{$id_config["sec_code"]}"
  system("#{default_device.adb_command} shell input text #{$Configuration["SecurityCode"]}")
  system("#{default_device.adb_command} shell input keyevent KEYCODE_BACK")
  else
  ##IOS Code starts
  ios_connect(session)
  sleep 3
  tap_mark 'Security code'
  wait_for_keyboard
  keyboard_enter_text "#{$Configuration["SecurityCode"]}"
  tap_mark 'Done'
  end
end

##And Session S1. Save Breakfast price 
Then(/^Session ([\w\d]+). Save ([\d]+) days Breakfast price for ([\d]+) persons$/) do |session,days,num|
 if $Configuration[session+"DeviceType"] == "Android"
 set_default_device($session[session])
  sleep 3
  price_val=query("* id:'txt_price'", :text)[0].gsub(/\£/,'')
  act_breakfast_price=price_val.gsub(/ per person, per day/,'').to_f
  act_breakfast_price=act_breakfast_price*num.to_f*days.to_f
  begin
  $flexi_price=$flexi_price+act_breakfast_price
  puts "Price with Breakfast: "+$flexi_price.to_s
  rescue
  end
  begin
  $saver_price=$saver_price+act_breakfast_price
  puts "Price with Breakfast: "+$saver_price.to_s
  rescue
  end 
  else
  ##IOS Code starts
  ios_connect(session)
  sleep 3
  scroll("*", :up)
  scroll("*", :up)
  sleep 5
  price_val=query("MCSubheaderLabel", :text)[0].gsub(/\£/,'')
  act_breakfast_price=price_val.gsub(/ per person, per day/,'').to_f
  act_breakfast_price=act_breakfast_price*num.to_f*days.to_f
  begin
      $flexi_price=$flexi_price+act_breakfast_price
      puts "Price with Breakfast: "+$flexi_price.to_s
      rescue
  end
  begin
      $saver_price=$saver_price+act_breakfast_price
      puts "Price with Breakfast: "+$saver_price.to_s
      rescue
  end
 end  
end

##And Session S1. Verify complete flexi price
Then(/^Session ([\w\d]+). Verify complete ([\w ]+)$/) do |session,pricetype|
 if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 20
  /scroll_down/
  a=query("webView css:'*'", :textContent)[22]
      k=a.split("Amount:")
      disp_price=k[1].to_f   
  if pricetype == "flexi price"
    if disp_price == $flexi_price
      puts "Pass"
    else
      fail("Disp price:" + disp_price.to_s)
      fail("Calculated price:" + $flexi_price.to_s)
    end
  else
    if disp_price == $saver_price
      puts "Pass"
    else
      fail("Disp price:" + disp_price.to_s)
      fail("Calculated price:" + $saver_price.to_s)
    end
  end
  else
  ##IOS code starts
  ios_connect(session)
  sleep 20
  #scroll("*", :down)
  a=query("webView css:'*'")[22]["textContent"]
  k=a.split("Amount:")
  disp_price=k[1].to_f
  if pricetype == "flexi price"
      if disp_price == $flexi_price
          puts "Pass"
          else
          fail("Disp price:" + disp_price.to_s)
          fail("Calculated price:" + $flexi_price.to_s)
      end
      else
      if disp_price == $saver_price
          puts "Pass"
          else
          fail("Disp price:" + disp_price.to_s)
          fail("Calculated price:" + $saver_price.to_s)
      end
  end
  end
end

##Then Session S1. I should be able to see Booking confirmed screen
Then(/^Session ([\w\d]+). I should be able to see Booking confirmed screen$/) do |session|
if $Configuration[session+"DeviceType"] == "Android"
  set_default_device($session[session])
  sleep 3
  var=query("* id:'#{$id_config["ref_code"]}'", :text)[0]
  puts "Booking Reference: "+var
  var=query("* id:'#{$id_config["date_code"]}'", :text)[0]
  puts "Booking dates: "+var
  var=query("* id:'#{$id_config["email_code"]}'", :text)[0]
  puts "Email sent to: "+var
  else
  ios_connect(session)
  sleep 10
  var=query("UILabel", :text)[6]
  puts var
  var=query("UILabel", :text)[8].to_s.split("\n")[0]
  puts "Booking status --- "+var
  var=query("UIButtonLabel", :text)[1]
  puts "Email sent to: "+var
  end
end

##Given Session S1. Enter Passport details
Then(/^Session ([\w\d]+). Enter Passport details$/) do |session|
  set_default_device($session[session])
  sleep 3
  scroll_down
  scroll_down
  scroll_down
  scroll_down
  scroll_down
  query("* id:'"+$id_config["passport_id"]+"'", {:setText => ""})
  query("* id:'"+$id_config["passport_id"]+"'", {:setText => "#{$Configuration["PassportNumber"]}"})
  query("* id:'"+$id_config["passport_location"]+"'", {:setText => ""})
  query("* id:'"+$id_config["passport_location"]+"'", {:setText => "#{$Configuration["PassportIssuePlace"]}"})
  query("* id:'"+$id_config["passport_nextdest"]+"'", {:setText => ""})
  query("* id:'"+$id_config["passport_nextdest"]+"'", {:setText => "#{$Configuration["PassportNextdestination"]}"})
end


##And Session S1. Enable purchases on account
Then(/^Session ([\w\d]+). Enable purchases on account$/) do |session|
    if $Configuration[session+"DeviceType"] == "Android"
        set_default_device($session[session])
        else
        ios_connect(session)
        sleep 3
        touch("UISwitch")
        end
end

##And Session S1. Enter Business Account Email and Password
Then(/^Session ([\w\d]+). Enter Business Account Email and Password$/) do |session|
    if $Configuration[session+"DeviceType"] == "Android"
        set_default_device($session[session])
        else
        ios_connect(session)
        sleep 3
        tap_mark "Username"
        wait_for_keyboard
        keyboard_enter_text "#{$Configuration["BusinessEmail"]}"
        tap_mark 'Done'
        sleep 2
        tap_mark "Password"
        wait_for_keyboard
        keyboard_enter_text "#{$Configuration["BusinessPassword"]}"
        tap_mark 'Done'
        end
end

##Then Session S1. Add Title as Mr
Then(/^Session ([\w\d]+). Add ([\w]+) as ([\w ]+)$/) do |session,ops,text|
    if $Configuration[session+"DeviceType"] == "Android"
        set_default_device($session[session])
        else
        ios_connect(session)
        if ops == "Title"
            tap_mark 'Title'
            sleep 2
            tap_mark text.to_s
            sleep 2
         elsif ops == "FirstName"
            tap_mark 'First name'
            wait_for_keyboard
            keyboard_enter_text text.to_s
            tap_mark 'Done'
            sleep 2
         elsif ops == "LastName"
            tap_mark 'Last name'
            wait_for_keyboard
            keyboard_enter_text text.to_s
            tap_mark 'Done'
            sleep 2
         elsif ops == "Nationality"
         tap_mark 'Nationality'
         while element_does_not_exist("* {text CONTAINS'#{text.to_s}'}")
             scroll("UITableViewCellScrollView", :down)
         end
         touch("* {text CONTAINS'#{text.to_s}'}")
         tap_mark 'Done'
         sleep 2
     end
end
end

##Then Session S1. Cancel the last booking
Then(/^Session ([\w\d]+). Cancel the last booking$/) do |session|
    if $Configuration[session+"DeviceType"] == "Android"
        set_default_device($session[session])
        else
        ios_connect(session)
        sleep 3
        scroll("*", :down)
        sleep 2
        a=query("* text:'London Covent Garden'").count
        touch(query("* text:'London Covent Garden'")[a-1])
        sleep 5
        while element_does_not_exist("* text:'Cancel booking'")
            scroll("*", :down)
        end
        sleep 2
        touch("* text:'Cancel booking'")
        sleep 5
        tap_mark "Password"
        wait_for_keyboard
        keyboard_enter_text "#{$Configuration["UserPassword"]}"
        tap_mark 'Log in'
    end
end

