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
Then(/^Session ([\w\d]+). Switch ON Light if OFF$/) do |session|
  set_default_device($session[session])
  if element_does_not_exist("* id:'light_reading_button'")
    tap_mark  $id_config["light_switch"]
  end
end


##And Session S1. Switch OFF Light
Then(/^Session ([\w\d]+). Switch ([\w]+) Light$/) do |session,ops|
  set_default_device($session[session])
    tap_mark  $id_config["light_switch"]
    sleep 5
end