Then(/^Session ([\w\d]+). I set ([\w]+) as ([\w -\.]+)$/) do |session,ops,selection|
  set_default_device($session[session])
  sleep 5
  if ops == "PriceRange"
    var=query("* id:'seek_bar'").to_s
    exp=/. ([\d,-]+) #/
    exp1=/\"y...([\d]+)/
    m=exp.match(var)
    m2=exp1.match(var)
    coord=m.captures[0]
    coord_y=m2.captures[0].to_s
    startx_coord=coord.split("-")[0]
    endx_coord=coord.split("-")[1]
    act_start=startx_coord.split(",")[0].to_i
    act_end=endx_coord.split(",")[0].to_i
    diff=act_end-act_start
    temp_str=selection.split(",")[0]+selection.split(",")[1]
    temp_str=temp_str.to_i
    price_ratio=temp_str.to_f/11000
    diff=price_ratio.to_f*diff
    diff=diff.to_i.to_s
    system("#{default_device.adb_command} shell input touchscreen tap #{diff} #{coord_y}")
    sim=diff.to_i
    count=0
    while count <= 1000
      str = "KZT "+selection.to_s
      sim=sim+1
      system("#{default_device.adb_command} shell input touchscreen tap #{sim} #{coord_y}")
      if query("* id:'seek_bar_value_text_view'", :text)[0] == str || act_start == act_end-1
        break
      end
      count=count+1
    end
  elsif ops == "city"
    if !element_exists("* id:'spinner_city_selection'")
      scroll_down
      scroll_down
    end
    touch("* id:'spinner_city_selection'")
    sleep 2
    touch("* text:'#{selection.to_s}'")
  elsif ops == "BodyType"
    if !element_exists("* id:'spinner_body_selection'")
      scroll_down
      scroll_down
    end
    i=0
    touch("* id:'spinner_body_selection'")
    sleep 2
    if element_exists("* text:'#{selection.to_s}'")
      touch("* text:'#{selection.to_s}'")
    else
    while (i <= 5)
       scroll_down
       i+=1
       if element_exists("* text:'#{selection.to_s}'")
           break
        end
    end
     touch("* text:'#{selection.to_s}'")
   end
  elsif ops == "FuelType"
    if !element_exists("* id:'spinner_fuel_selection'")
      scroll_down
      scroll_down
    end
    touch("* id:'spinner_fuel_selection'")
    sleep 2
    touch("* text:'#{selection.to_s}'")
  elsif ops == "TransmissionType"
    if !element_exists("* id:'spinner_fuel_selection'")
      scroll_down
      scroll_down
    end
    touch("* id:'spinner_transmission_selection'")
    sleep 2
    touch("* text:'#{selection.to_s}'")
  elsif ops == "EngineSize"
    if !element_exists("* id:'spinner_engine_selection'")
      scroll_down
      scroll_down
    end
    touch("* id:'spinner_engine_selection'")
    sleep 2
    touch("* text:'#{selection.to_s}'")
  elsif ops == "DealerType"
    if !element_exists("* id:'spinner_dealership_selection'")
      scroll_down
      scroll_down
    end
     touch("* id:'spinner_dealership_selection'")
     sleep 2
     touch("* text:'#{selection.to_s}'")
  elsif ops == "WheelDriveType"
    if !element_exists("* id:'spinner_wheel_drive_selection'")
      scroll_down
      scroll_down
    end
    touch("* id:'spinner_wheel_drive_selection'")
    sleep 2
    touch("* text:'#{selection.to_s}'")
  else
    puts "Option not visible"
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


Then(/^Session ([\w\d]+). Verify filter selection text ([\w -\.]+)$/) do |session,text|
  set_default_device($session[session])
  sleep 3
  if element_exists("* { text CONTAINS '"+text.to_s+"'}")
    puts "Filter Text - "+text.to_s
  else
    fail("Filter text doesn't exist")
  end
end