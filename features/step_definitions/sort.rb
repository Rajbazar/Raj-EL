Then(/^Session ([\w\d]+). I store the list visible on Car Finder Screen$/) do |session|
  set_default_device($session[session])
  sleep 3
  $car_name=Array.new
  $car_price=Array.new
  $car_installment=Array.new
  i=0
  j=0
  while (i <= 10)
    var_temp=query("*", :id)
    junk_index=var_temp.each_index.select{|k| var_temp[k] == 'text_view_model'}
    $car_name.push(query("*", :text)[junk_index[0]+2])
    $car_name.push(query("*", :text)[junk_index[1]+2])
    if $Configuration["CarFinderScreenNo"] == "3"
    begin
    $car_name.push(query("*", :text)[junk_index[2]+2])
    rescue
    end
    end
    var_temp=query("*", :id)
    junk_index=var_temp.each_index.select{|k| var_temp[k] == 'text_view_price'}
    $car_price.push(query("*", :text)[junk_index[0]+2])
    $car_price.push(query("*", :text)[junk_index[1]+2])
    if $Configuration["CarFinderScreenNo"] == "3"
    begin
    $car_price.push(query("*", :text)[junk_index[2]+2])
    rescue
    end
    end
    var_temp=query("*", :id)
    junk_index=var_temp.each_index.select{|k| var_temp[k] == 'text_view_pcm'}
    $car_installment.push(query("*", :text)[junk_index[0]+2])
    $car_installment.push(query("*", :text)[junk_index[1]+2])
    if $Configuration["CarFinderScreenNo"] == "3"
    begin
    $car_installment.push(query("*", :text)[junk_index[2]+2])
    rescue
    end
    end
    begin
      scroll_down
      sleep 3
    rescue
    end
    i+=1
  end
  while (j <= 10)
    begin
      scroll_up
    rescue
    end
    j+=1
  end
  $car_name=$car_name.uniq
  $car_price=$car_price.uniq
  $car_installment=$car_installment.uniq
end

##Then Session S1. Verify sorted list for Featured

Then(/^Session ([\w\d]+). Verify sorted list for ([\w :]+)$/) do |session,listName|
  set_default_device($session[session])
  sleep 3
  def sort_verify opt
    junk_car_name=Array.new
    junk_car_price=Array.new
    junk_car_installment=Array.new
    i=0
    j=0
    while (i <= 10)
      var_temp=query("*", :id)
      junk_index=var_temp.each_index.select{|k| var_temp[k] == 'text_view_model'}
      junk_car_name.push(query("*", :text)[junk_index[0]+2])
      junk_car_name.push(query("*", :text)[junk_index[1]+2])
      begin
      junk_car_name.push(query("*", :text)[junk_index[2]+2])
      rescue
      end
      var_temp=query("*", :id)
      junk_index=var_temp.each_index.select{|k| var_temp[k] == 'text_view_price'}
      junk_car_price.push(query("*", :text)[junk_index[0]+2])
      junk_car_price.push(query("*", :text)[junk_index[1]+2])
      begin
      junk_car_price.push(query("*", :text)[junk_index[2]+2])
      rescue
      end
      var_temp=query("*", :id)
      junk_index=var_temp.each_index.select{|k| var_temp[k] == 'text_view_pcm'}
      junk_car_installment.push(query("*", :text)[junk_index[0]+2])
      junk_car_installment.push(query("*", :text)[junk_index[1]+2])
      begin
      junk_car_installment.push(query("*", :text)[junk_index[2]+2])
      rescue
      end
      begin
        scroll_down
      rescue
      end
      i+=1
    end
    while (j <= 10)
      begin
        scroll_up
      rescue
      end
      j+=1
    end
    junk_car_name=junk_car_name.uniq
    junk_car_price=junk_car_price.uniq
    junk_car_installment=junk_car_installment.uniq
    if opt == 1
      return junk_car_name
    elsif opt == 2
      return junk_car_price
    elsif opt == 3
      return junk_car_installment
    end
  end
  def getPrice price_list
    arr_temp=Array.new
    arr_temp1=Array.new
    price_list.each do |x|
      temp1=(x.split[1])
      if temp1.include? ','
        arr_temp.push(temp1.delete! ',')
      else
        arr_temp.push(temp1)
      end
    end
    arr_temp.each do |item|
      arr_temp1.push(item.to_i)
    end
    return arr_temp1.uniq
  end
    if listName == "Featured"
    puts "Same list, nothing to be verified"
    elsif listName == "Manufacturer"
      check_manufacturer = sort_verify 1
       if check_manufacturer == $car_name.uniq.sort
        puts "Pass"
      else
        fail("List doesn't match")
      end
    elsif listName == "Price: lowest first"
      check_manufacturer = sort_verify 2
      a=getPrice check_manufacturer
      b=getPrice $car_price
      if a == b.sort
         puts "Pass"
      else
        fail("List doesn't match")
      end
    elsif listName == "Price: highest first"
      check_manufacturer = sort_verify 2
      a=getPrice check_manufacturer
      b=getPrice $car_price
      b=b.sort
      if a == b.reverse!
        puts "Pass"
      else
        fail("List doesn't match")
      end
  end
end

##Given Session S1. Create profile
Then(/^Session ([\w\d]+). Create profile$/) do |session|
  set_default_device($session[session])
  sleep 3
  wait_for_elements_exist(["* id:'up'"], :timeout => 35)
  touch("* id:'up'")
  wait_for_elements_exist(["* text:'More'"], :timeout => 35)
  touch("* text:'More'")
  sleep 2
  tap_mark 'My Profile'
  query("* id:'my_profile_name_edit_text'", {:setText => ""})
  query("* id:'my_profile_mobile_edit_text'", {:setText => ""})
  query("* id:'my_profile_email_edit_text'", {:setText => ""})
  query("* id:'my_profile_name_edit_text'", {:setText => ""+$Configuration["ProfileName"]+""})
  query("* id:'my_profile_mobile_edit_text'", {:setText => ""+$Configuration["ProfileNumber"]+""})
  query("* id:'my_profile_email_edit_text'", {:setText => ""+$Configuration["ProfileEmail"]+""})
  sleep 3
  tap_mark 'Save'

end


Then(/^Session ([\w\d]+). Select car ([\w\d -]+)$/) do |session,carName|
  set_default_device($session[session])
  sleep 3
  if element_exists("* {text CONTAINS '"+carName.to_s+"'}")
    touch("* {text CONTAINS '"+carName.to_s+"'}")
  else
  i=0
  while i <= 10
    begin
      scroll_down
    rescue
    end
    if element_exists("* {text CONTAINS '"+carName.to_s+"'}")
      scroll_down
      touch("* {text CONTAINS '"+carName.to_s+"'}")
      break
    end
    i=i+1
  end
  sleep 2
  end
end

Then(/^Session ([\w\d]+). Apply for Loan$/) do |session|
  set_default_device($session[session])
  sleep 3
  touch("* id:'car_details_appy_loan_button'")
  sleep 3
  tap_mark 'action_submit'
  sleep 3
  tap_mark 'I Understand'
  sleep 5
end


Then(/^Session ([\w\d]+). Display reference code$/) do |session|
  set_default_device($session[session])
  sleep 3
  puts "Your reference code: " + query("* id:'loan_application_received_ref_text_view'", :text)[0]
end
