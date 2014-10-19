
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