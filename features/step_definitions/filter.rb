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
    touch("* {text CONTAINS'#{selection.to_s}'}")
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
     touch("* {text CONTAINS'#{selection.to_s}'}")
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


Then(/^Session ([\w\d]+). Verify filter with text ([\w -\.]+)$/) do |session,text|
  set_default_device($session[session])
  sleep 3
  flag=true
  fields=text.to_s.split(", ")
  text=text.to_s.gsub(/Any [\w ]+, /,'')
  if element_exists("* { text CONTAINS '"+text.to_s+"'}")
    puts "Filter Text - "+text.to_s
    res_str=query("* id:'button_apply_filter'",:text)[0]
    exp=/.*\(([0-9]+).*/
    no_of_res=exp.match(res_str)[1].to_i
    if no_of_res == 0
      fail("No Results Found, either change the test steps or verify manually")
    else
      tap_mark 'button_apply_filter'
      sleep 5
      touch(query("* id:'text_view_model'")[0])
      sleep 10
      text_price=fields[0].delete! ','
      text_price=text_price.to_i
      act_price=query("* id:'car_details_label_view_1' * index:2", :text)[0].delete! 'KZT ,'
      act_price=act_price.to_i
      if act_price <= text_price
        flag=true
      else
        flag=false
        fail("Price not as per filter")
      end
        car_specs_name=Array.new
        car_specs_value=Array.new
        i=0
        while i < 10
          car_specs_name.push(query("* id:'car_details_spec_list_name_text_view'", :text)[i])
          car_specs_name.push(query("* id:'car_details_spec_list_name_text_view'", :text)[i+1])
          car_specs_name.push(query("* id:'car_details_spec_list_name_text_view'", :text)[i+2])
          car_specs_name.push(query("* id:'car_details_spec_list_name_text_view'", :text)[i+3])
          car_specs_value.push(query("* id:'car_details_spec_list_value_text_view'", :text)[i])
          car_specs_value.push(query("* id:'car_details_spec_list_value_text_view'", :text)[i+1])
          car_specs_value.push(query("* id:'car_details_spec_list_value_text_view'", :text)[i+2])
          car_specs_value.push(query("* id:'car_details_spec_list_value_text_view'", :text)[i+3])
          if i%2 ==0
          scroll_down
          end
         i+=1
        end
        car_specs_name=car_specs_name.uniq!
        car_specs_value=car_specs_value.uniq!
        ###Merge Arrays####
        if car_specs_name.length == car_specs_value.length
            specs=Hash.new
            j=0
            while j <= car_specs_value.length
              specs[car_specs_name[j].to_s]=car_specs_value[j].to_s
              j+=1
            end
        end
        if ((specs["Body Type"].downcase.include? fields[2].downcase || fields[2].downcase == "any body type") && (specs["Fuel Type"].downcase.include? fields[3].downcase || fields[3].downcase == "any fuel type") && (specs["Transition Type"].downcase.include? fields[4].downcase || fields[4].downcase == "any transmission type") && (specs["Wheel Drive"].downcase.include? fields[6].downcase || fields[6].downcase == "any wheel drive type"))
          flag=true
        else
          flag=false
        end
        if fields[7].include? " - "
          eng_size_range=fields[7].delete "L"
          eng_size=eng_size_range.split(" - ")
          specs_eng_size=specs["Engine Size"].gsub(' litres','').to_f
          if specs_eng_size >= eng_size[0].to_f && specs_eng_size < eng_size[1].to_f
            flag=true
          else
            flag=false
          end
        else
          eng_size_range=fields[7].delete "L+"
          specs_eng_size=specs["Engine Size"].gsub(' litres','').to_f
          if specs_eng_size >= eng_size_range.to_f
            flag=true
          else
            flag=false
          end
        end
    end
  else
    fail("Filter text doesn't exist")
  end
  if flag == true
     puts "Filter Verification successful"
  else
    fail("Filter Verification Failed")
  end
end