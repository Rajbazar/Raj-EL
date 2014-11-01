
Then(/^Session ([\w\d]+). I ([\w]+) the selected car (in|from) my garage$/) do |session,ops,extra|
      set_default_device($session[session])
      sleep 3
      if ops == "add"
        touch("* id:'action_add_to_garage'")
      else
        touch("* id:'action_add_to_garage'")
      end
end

Then(/^Session ([\w\d]+). Verify pop up text as ([\w ]+)$/) do |session,text|
  set_default_device($session[session])
  if element_exists("* {text CONTAINS '#{text.to_s}'}")
    puts "Popup Text verified"
  else
    fail("Popup doesn't appear")
  end
end

##touch("* id:'action_garage'")
Then(/^Session ([\w\d]+). Verify car ([\w ]+) is being added to Garage$/) do |session,carName|
  set_default_device($session[session])
  sleep 3
  touch("* id:'action_garage'")
  sleep 5
  if element_exists("* {text CONTAINS '#{carName.to_s}'}")
    puts "Car exists in Garage"
  else
    fail("Car doesn't exist in Garage")
  end
end

##Verify Transformers Optimus Prime car is added 1-times in Application History with current date
Then(/^Session ([\w\d]+). Verify ([\w ]+) car is added ([\d]+)-times in Application History with current date/) do |session,carName,times|
  set_default_device($session[session])
  sleep 3
  flag=true
  currDate=Time.new.strftime("%d/%m/%Y")
  arr_carName=query("* id:'application_history_list_name_text_view'", :text)
  if element_exists("* text:'"+carName.to_s+"'")
     flag=true
  else
    flag=false
    fail("Car not found in Application History")
  end  
  if arr_carName.length == times.to_i
    flag=true
  else
    flag=false
    fail("No. of times is not as expected")
  end
  
  ##application_history_list_date_text_view
  ##application_history_list_name_text_view
end 