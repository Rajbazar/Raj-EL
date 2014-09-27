#require 'calabash-android/calabash_steps'
#puts "2222"

## wait_for_elements_exist( ["button marked:'OK'"], :timeout => 20)
Then(/^Session ([\w\d]+). I tap on ([\w \& ]+)$/) do |session,ops|
	set_default_device($session[session])
	sleep 5
	if ops == "LeftMenu"
		wait_for_elements_exist(["* id:'up'"], :timeout => 35)
		touch("* id:'up'")
	elsif ops == "CarFinder"
		wait_for_elements_exist(["* id:'nav_drawer_item_title' * text:'Car Finder'"], :timeout => 35)
		touch("* id:'nav_drawer_item_title' * text:'Car Finder'")	
	elsif ops == "Scan & Shop"  
	 	wait_for_elements_exist(["* text:'Scan & Shop'"], :timeout => 35)
	    touch("* text:'Scan & Shop'")		
	elsif ops == "Application History"
	    wait_for_elements_exist(["* text:'Application History'"], :timeout => 20)	
	    touch("* text:'Application History'")
	    sleep 10 
	elsif ops == "More"
		#wait_for_elements_exist(["* text:'More'"], :timeout => 35)    	
		touch("* text:'More'")
	 elsif ops == "BackButton"
	 	begin
	    	touch(query("ImageView")[0])	
	    	##For Application History Back button
	    rescue 
	    end
	    begin
	    	touch(query("ImageView")[1]) 		
	    rescue 
	    end	
    elsif ops == "English"
	elsif ops == "DONE"
		tap_mark 'Done'
	elsif ops == "Russian"
		touch("* text:'Pусский'")
	elsif ops == "Kazakh"
		touch("* text:'Қазакх'")
  elsif ops == "plus button"
    touch("* id:'plus_button'")
  elsif ops == "search button"
    touch("* id:'search_button'")
  elsif ops == "sort button"
    touch("* id:'sort_button'")
  elsif ops == "filter button"
    touch("* id:'filter_button'")
	else	
		touch("* text:'"+ops+"'")	
	end
end

Then(/^Session ([\w\d]+). wait ([\w]+) list to appear for ([\d]+) seconds$/) do |session, listname, timeval|
    if listname == "CarFinder" ||  listname == "More"
	   a=query("TextView", :text)
	   temp1 = a.length
	   puts a.length.to_s
	   sleep timeval.to_i
	   a=query("TextView", :text)
	   puts a.length.to_s
	   if (a.length == temp1)
		  fail("List not updated")
	   else
	   end
    end		
end

##Then Session S1. should see the More Listings

Then(/^Session ([\w\d]+). I should see the ([\w \& ]+) Listings$/) do |session, listname|
	set_default_device($session[session])
	if listname == "CarFinder"
		var = query("* id:'label_text_view'", :text)
		puts var
	elsif listname ==  "Scan & Shop"
	    var = query("* id:'label_text_view'", :text)
	    var = var + query("* id:'buttonApply1'", :text)
	    puts var    		
	elsif listname == "Application History"
	    var = query("* id:'label_text_view'", :text)
	    var = var + query("* id:'carDetailsTextView'", :text)
	    var = var + query("TextView", :text)
	    var = var + query("Button", :text)
	    var = var + query("* id:'button1'", :text)
	    puts var
	elsif listname == "More"
		var = query("* id:'more_terms_and_policy_text_view'", :text)
		var = var + query("* id:'more_my_profile_button'", :text)
		var = var + query("* id:'more_advice_button'", :text)
		var = var + query("* id:'more_version_text_view'", :text)
		puts var    
	else
		puts "Wrong input"
	end	
end

##Then Uninstall all apps
Then(/^Uninstall all apps$/) do
	begin
	set_default_device($session["S1"])
	uninstall_apps()
	set_default_device($session["S2"])
	uninstall_apps()
	rescue
	end	
end

##Then Session S1. Clear data
Then(/^Session ([\w\d]+). Clear data$/) do |session|
	set_default_device($session[session])
	clear_app_data
end 