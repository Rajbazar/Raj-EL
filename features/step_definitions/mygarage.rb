
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


Then(/^Session ([\w\d]+). Verify ([\w ]+) car is added ([\d]+)-times in Application History with current date/) do |session,carName,times|
  set_default_device($session[session])
  sleep 3
  flag=true
  currDate=Time.new.strftime("%d/%m/%Y")
  arr_carName=query("* text:'"+carName.to_s+"'")
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
   i=0
   while i < 10
     arr=query("*", :text)
     junk_index=arr.each_index.select{|k| arr[k] == carName.to_s}
     str=query("*", :text)[junk_index[0]+2]
     if str == currDate
       flag=true
     else
       flag=false
       fail("Date not matching")
     end
     scroll_down
     i+=1
   end
  ##application_history_list_date_text_view
  ##application_history_list_name_text_view
end 


Then(/^Session ([\w\d]+). Verify that basket has atleast ([\d]+) products$/) do |session,val|
  set_default_device($session[session])
  sleep 3
  tmp=query("* id:'basket_total_items_text'", :text)[0]
  m=/Total \(([\d]+)/.match(tmp)
  no_items=m.captures[0] 
  if no_items.to_i >= val.to_i
    puts "No of items greater or equal to "+val
  else
    fail("Value is less then expected")
  end 
end

##Then Session S1. Select product and apply Loan
Then(/^Session ([\w\d]+). Select product and apply Loan$/) do |session|
  set_default_device($session[session])
  sleep 3
  touch(query("* id:'image_view_product'")[0])
  sleep 3
  tap_mark 'details_appy_loan_button'
  sleep 3
  tap_mark 'action_submit'
  sleep 3
  tap_mark 'I Understand'
  sleep 5
end


