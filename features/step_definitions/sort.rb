Then(/^Session ([\w\d]+). I store the list visible on Car Finder Screen$/) do |session|
  set_default_device($session[session])
  sleep 3
  $car_name=Array.new
  $car_price=Array.new
  $car_installment=Array.new
  i=0
  j=0
  while (i <= 10)
    var=query("* id:'label_text_view'", :text)
    $car_name.push(var[2])
    $car_name.push(var[5])
    $car_price.push(var[0])
    $car_price.push(var[3])
    $car_installment.push(var[1])
    $car_installment.push(var[4])
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
  $car_name=$car_name.uniq
  $car_price=$car_price.uniq
  $car_installment=$car_installment.uniq
end

##Then Session S1. Verify sorted list for Featured

Then(/^Session ([\w\d]+). Verify sorted list for ([\w :]+)/) do |session,listName|
  set_default_device($session[session])
  sleep 3
   temp_car_name=$car_name
   temp_car_price=$car_price
   temp_car_installment=$car_installment
  def sort_verify opt
    junk_car_name=Array.new
    junk_car_price=Array.new
    junk_car_installment=Array.new
    i=0
    j=0
    while (i <= 10)
      var=query("* id:'label_text_view'", :text)
      junk_car_name.push(var[2])
      junk_car_name.push(var[5])
      junk_car_price.push(var[0])
      junk_car_price.push(var[3])
      junk_car_installment.push(var[1])
      junk_car_installment.push(var[4])
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
    if listName == "Featured"
    puts "Same list, nothing to be verified"
    elsif listName == "Manufacturer"
      check_manufacturer = sort_verify 1
       if check_manufacturer == $car_name.sort
        puts "Pass"
      else
        fail("List doesn't match")
      end
    elsif listName == "Price: lowest first"
      check_manufacturer = sort_verify 2
      #####TBD####
    elsif listName == "Price: highest first"
      check_manufacturer = sort_verify 2
      #####TBD####
  end
end