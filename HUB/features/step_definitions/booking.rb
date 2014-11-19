## Then Session S1. Select ArrivingDate as 21,March,2015
Then(/^Session ([\w\d]+). Select ([\w]+) as ([\w\d,]+)$/) do |session,action,date|
  set_default_device($session[session])
    sleep 3
    def date_select(str)
      a=str
      a=a.split(",")
      date_no=a[0].to_s
      date_month=a[1].to_s
      date_year=a[2].to_s
      month_year=date_month + " " + date_year
      i=0
      while (i<20)
        scroll_down
        if element_exists("* text:'"+month_year+"'")
          scroll_down
          break
        end
        i+=1  
      end
      touch(query("* text:'"+date_no+"' * enabled:'true'")[0])
      puts "Date selected"
      while(i>=0)
        scroll_up
        i-=1
      end  
    end
    if action == "ArrivingDate"
      date_select(date.to_s)
    else
      date_select(date.to_s)
    end
end
  
## Then Session S1. Book Accessible room for 2 adults
Then(/^Session ([\w\d]+). Book ([\w]+) room for ([\w\d &]+)$/) do |session,roomType,guest|
  set_default_device($session[session])
    sleep 3
    if roomType == "Standard"
      tap_mark $id_config["standard"]
    else
      tap_mark $id_config["accessible"]
    end  
       
    if guest == "1 adult"
      tap_mark $id_config["one_adult"]
    elsif guest == "2 adults"
      tap_mark $id_config["two_adults"]
    else
      tap_mark $id_config["adult_and_child"] 
    end          
end

##Then Session S1. Display Hub Flex Price and Hub Saver priced
Then(/^Session ([\w\d]+). I should see Hub Flex Price and Hub Saver price$/) do |session|
  set_default_device($session[session])
    sleep 20  
    puts "Hub Flex Price: " + query("* id:'"+$id_config["price_rate"]+"'", :text)[0].to_s
    puts "Hub Saver Price: " + query("* id:'"+$id_config["price_rate"]+"'", :text)[1].to_s
  end
