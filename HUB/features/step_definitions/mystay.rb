##Then Session S1. Enter email and password for room-connection

Then(/^Session ([\w\d]+). Enter email and password for room-connection$/) do |session|
  set_default_device($session[session])
  sleep 5
  query("* id:'"+$id_config["room_email"]+"'", {:setText => ""})
  query("* id:'"+$id_config["room_email"]+"'", {:setText => "#{$Configuration["RoomEmail"]}"})
  query("* id:'"+$id_config["room_pass"]+"'", {:setText => ""})
  query("* id:'"+$id_config["room_pass"]+"'", {:setText => "#{$Configuration["RoomPassword"]}"})
  tap_mark  $id_config["room_login_button"]
  sleep 15
  tap_mark "Yes"
end

##And Session S1. Control Lighting
Then(/^Session ([\w\d]+). Control ([\w ]+)$/) do |session,ops|
  set_default_device($session[session])
  sleep 5
  if ops == "Lighting"
    tap_mark  $id_config["lighting"]
  elsif ops == "TV"
    tap_mark  $id_config["tv_control"]
  elsif ops == "Temperature"
    tap_mark  $id_config["temperature_control"]
  end
end

##And Session S1. Decrease Brghtness
Then(/^Session ([\w\d]+). Decrease ([\w ]+)$/) do |session,variation|
  set_default_device($session[session])
  sleep 5
  if variation == "Brightness"
    tap_mark  $id_config["light_decrease"]
  else
    puts "TBD"
  end
end

##Then Session S1. Select full light bulb
Then(/^Session ([\w\d]+). Select ([\w]+) light bulb$/) do |session,type|
  set_default_device($session[session])
  if type == "full"
    tap_mark  $id_config["light_full"]
  elsif type == "medium"
    tap_mark  $id_config["light_mid"]
  else
    tap_mark  $id_config["light_low"]
  end
end

Then(/^Session ([\w\d]+). Increase ([\w ]+)$/) do |session,variation|
  set_default_device($session[session])
  sleep 5
  if variation == "Brightness"
    tap_mark  $id_config["light_increase"]
  else
    puts "TBD"
  end
end

##And Session S1. Switch ON Light if OFF
Then(/^Session ([\w\d]+). Switch ON ([\w]+) if OFF$/) do |session,type|
  set_default_device($session[session])
  sleep 3
  if type == "Light"
  if element_exists("* id:'light_spotlight'")
    tap_mark  $id_config["light_switch"]
 end
  elsif type == "TemperatureControl"
    if element_exists("* id:'temp_spotlight'")
      tap_mark  $id_config["temp_switch"]
    end
  elsif type == "TVControl"
    if element_exists("* id:'tv_remote_spotlight'")
      tap_mark  $id_config["tv_switch"]
    end
  end
end

##And Session S1. Switch OFF Light
Then(/^Session ([\w\d]+). Switch ([\w]+) Light$/) do |session,ops|
  set_default_device($session[session])
    tap_mark  $id_config["light_switch"]
    sleep 5
end

##And Session S1. Switch to Reading mode
Then(/^Session ([\w\d]+). Switch to Reading mode$/) do |session|
  set_default_device($session[session])
  sleep 3
  tap_mark $id_config["light_reading_button"]
end

Then(/^Session ([\w\d]+). Turn off ([\w]+)$/) do |session,ops|
  set_default_device($session[session])
  sleep 3
  if ops == "Bulb1"
    tap_mark $id_config["bulb1"]
  elsif ops == "Bulb2"
    tap_mark $id_config["bulb2"]
  end
end

##Then Session S1. Set temperature to 23 degrees
Then(/^Session ([\w\d]+). Set temperature to ([\d]+) degrees$/) do |session,ops|
  set_default_device($session[session])
  sleep 3
  begin
  get_curr_temp=query("* id:'"+$id_config["temp_text"]+"'", :text)[0].gsub(/\°/,'')
  puts "Current temperature: " + get_curr_temp
  get_curr_temp=get_curr_temp.to_i
  rescue
  end
  var=query("* id:'"+$id_config["temp_coord"]+"'").to_s
  exp=/. ([\d,-]+) #/
  m=exp.match(var)
  coord=m.captures[0]
  act_coord=coord.split("-")[1]
  x_coord=act_coord.split(",")[0].to_i
  y_coord=act_coord.split(",")[1].to_i
  ops=ops.to_i
  if ops > get_curr_temp
    i=0
    while i < 20
      system("#{default_device.adb_command} shell input swipe #{x_coord} #{y_coord} #{x_coord} #{y_coord-100}")
      curr_temp=query("* id:'"+$id_config["temp_text"]+"'", :text)[0].gsub(/\°/,'').to_i
      if curr_temp == ops
        puts "Changed Temperature: "+curr_temp.to_s
        break
      else
        i+=1
      end
    end
  else
    j=0
    while j < 20
      system("#{default_device.adb_command} shell input swipe #{x_coord} #{y_coord} #{x_coord} #{y_coord+100}")
      curr_temp=query("* id:'"+$id_config["temp_text"]+"'", :text)[0].gsub(/\°/,'').to_i
      if curr_temp == ops
        puts "Changed Temperature: "+curr_temp.to_s
        break
      else
        j+=1
      end
    end
  end
end

##And Session S1. Select full temperature button
Then(/^Session ([\w\d]+). Select ([\w]+) Fan button$/) do |session,ops|
  set_default_device($session[session])
  sleep 3
  if ops == "low"
    tap_mark $id_config["temp_low"]
  elsif ops == "medium"
    tap_mark $id_config["temp_med"]
  elsif ops == "full"
    tap_mark $id_config["temp_full"]
  else
    tap_mark $id_config["temp_auto"]
  end
end


## Then Session S1. Display room connect code
Then(/^Session ([\w\d]+). Display room connect code$/) do |session|
  set_default_device($session[session])
  sleep 3
  puts "Room Connect code: " + query("* id:'pair_code'", :text)[0].to_s
end

##And Session S1. I change channel up
Then(/^Session ([\w\d]+). I change channel ([\w]+)$/) do |session,channel_ops|
  set_default_device($session[session])
  sleep 3
  if channel_ops == "up"
    tap_mark $id_config["tv_channel_up"]
  elsif channel_ops == "down"
    tap_mark $id_config["tv_channel_down"]
  end
end

##Then Session S1. Display channel information
Then(/^Session ([\w\d]+). Display channel information$/) do |session|
  set_default_device($session[session])
  sleep 3
  puts "Channel information: " + query("* id:'"+$id_config["tv_channel_info"]+"'", :text)[0].to_s
end


##When Session S1. I mute the TV volume
Then(/^Session ([\w\d]+). I ([\w]+) the TV volume$/) do |session,volume_ops|
  set_default_device($session[session])
  sleep 3
  if volume_ops == "mute"
    tap_mark $id_config["tv_mute"]
  elsif volume_ops == "increase"
    tap_mark $id_config["tv_volume_up"]
  elsif volume_ops == "decrease"
    tap_mark $id_config["tv_volume_down"]
  end
end

##Then Session S1. I should see the selected channel description
Then(/^Session ([\w\d]+). I should see the selected channel description$/) do |session|
  set_default_device($session[session])
  sleep 3
  arr=query("*",:text)
  i=0
  while i < arr.length
    if arr[i] == "Watching"
       touch(query("*")[i+1])
       show_name = query("*",:text)[i+2]
       show_details = query("* id:'"+$id_config["current_show_details"]+"'",:text)[0]
       touch(query("*")[i+1])
       break
    else
      i+=1
    end
  end
  puts "Current show/movie name: "+show_name.to_s
  puts "Current show/movie details: "+show_details.to_s
end
