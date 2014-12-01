

Then(/^Session ([\w\d]+). Clear data$/) do |session|
  set_default_device($session[session])
  clear_app_data
  start_test_server_in_background
end

##Then Session S1. Display user Name
Then(/^Session ([\w\d]+). Display user ([\w]+)$/) do |session,ops|
  set_default_device($session[session])
  sleep 3
  if ops == "Name"
    puts "User Name saved: "+query("* id:'"+$id_config["disp_name"]+"'", :text)[0]
  elsif ops == "Contact"
    puts "User Contact saved: "+query("* id:'"+$id_config["user_mobile"]+"'", :text)[0]
  elsif ops == "Address"
    puts "User Address saved: "+query("* id:'"+$id_config["user_postcode"]+"'", :text)[0]
    puts query("* id:'"+$id_config["user_addressline1"]+"'", :text)[0]
    puts query("* id:'"+$id_config["user_addressline2"]+"'", :text)[0]
    puts query("* id:'"+$id_config["user_addressline3"]+"'", :text)[0]
    puts query("* id:'"+$id_config["country"]+"'", :text)[0]
  elsif ops == "securedCardNumber"
    sleep 2
    puts "Secured card number saved: " +query("* id:'"+$id_config["disp_cardnum"]+"'", :text)[0]
  elsif ops == "cardDetails"
    sleep 2
    puts "Secured card details saved: " +query("* id:'"+$id_config["card_type"]+"'", :text)[0]
    puts query("* id:'"+$id_config["card_fullname"]+"'", :text)[0]
    puts query("* id:'"+$id_config["card_endate"]+"'", :text)[0]
  end
end

##Then Session S1. Enter feedback user details

Then(/^Session ([\w\d]+). Enter feedback user details and comments$/) do |session|
tap_mark "#{$id_config["user_title"]}"
sleep 2
i=0
while (i < 5)
  if element_exists("* text:'#{$Configuration["UserTitle"]}'")
    tap_mark "#{$Configuration["UserTitle"]}"
    break
  else
    scroll_down
  end
  i+=1
end

sleep 2
query("* id:'"+$id_config["user_firstname"]+"'", {:setText => ""})
query("* id:'"+$id_config["user_firstname"]+"'", {:setText => "#{$Configuration["UserName"]}"})
query("* id:'"+$id_config["user_lastname"]+"'", {:setText => ""})
query("* id:'"+$id_config["user_lastname"]+"'", {:setText => "#{$Configuration["Userlastname"]}"})
query("* id:'"+$id_config["user_email"]+"'", {:setText => ""})
query("* id:'"+$id_config["user_email"]+"'", {:setText => "#{$Configuration["UserEmail"]}"})
sleep 2
query("* id:'"+$id_config["feedback_comment"]+"'", {:setText => ""})
query("* id:'"+$id_config["feedback_comment"]+"'", {:setText => "I like all cool features of this app!!"})
end
