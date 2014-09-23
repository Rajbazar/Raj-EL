Then(/^Session ([\w\d]+). I set ([\w]+) as ([\w ]+)$/) do |session,ops,selection|
  set_default_device($session[session])
  sleep 5
  if ops == "PriceRange"
    var=query("* id:'seek_bar_price_range'").to_s
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
    price_ratio=selection.to_f/10000
    diff=price_ratio.to_f*diff
    diff=diff.to_i.to_s
    system("#{default_device.adb_command} shell input touchscreen tap #{diff} #{coord_y}")
  elsif ops == "city"
    touch("* id:'spinner_city_selection'")
    sleep 2
    touch("* text:'#{selection.to_s}'")
  elsif ops == "BodyType"
    i=0
    touch("* id:'spinner_body_selection'")
    sleep 2
    if element_exists("* text:'#{selection.to_s}'")
      touch("* text:'#{selection.to_s}'")
    else
    while (i <= 5)
       scroll_down
       i=+1
       if element_exists("* text:'#{selection.to_s}'")
           break
        end
    end
     touch("* text:'#{selection.to_s}'")
   end
  elsif ops == "FuelType"
    touch("* id:'spinner_fuel_selection’")
    sleep 2
    touch("* text:'#{selection.to_s}'")
  elsif ops == "TransmissionType"
    touch("* id:'spinner_transmission_selection’")
    sleep 2
    touch("* text:'#{selection.to_s}'")
  elsif ops == "DealerType"
     touch("* id:'spinner_wheel_drive_selection'")
     sleep 2
     touch("* text:'#{selection.to_s}'")
  elsif ops == "WheelDriveType"
    touch("* id:'spinner_item_text_view'")
    sleep 2
    touch("* text:'#{selection.to_s}'")
  else
    puts "Option not visible"
  end
end

Then(/^Session ([\w\d]+). Scroll ([\w]+)$/) do |session,operation|
  if operation == "down"
    scroll_down
  elsif operation == "up"
    scroll_up
  end
end