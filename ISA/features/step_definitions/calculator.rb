Then(/^Session ([\w\d]+). Display ([\w ]+)$/) do |session,text|
  if $Configuration[session+"DeviceType"] == "Android"
    set_default_device($session[session])
    sleep 5
    if text == "Interest rate"
      puts query("* id:'calculator_interest_rate_textview'", :text)[0].to_s + " = " + query("* id:'calculator_interest_rate_textview_value'", :text)[0].to_s
    elsif text == "Interest earned"
      puts query("* id:'calculator_interest_earned_textview'", :text)[0].to_s + " = " + query("* id:'calculator_interest_earned_textview_value'", :text)[0].to_s
    elsif text == "tax saved"
      puts query("* id:'calculator_tax_saved_textview'", :text)[0].to_s + " = " + query("* id:'calculator_tax_saved_textview_value'", :text)[0].to_s
    end
  else
  end
end

## Then Session S1. Select investment amount
Then(/^Session ([\w\d]+). Select investment amount$/) do |session|
  if $Configuration[session+"DeviceType"] == "Android"
    set_default_device($session[session])
    sleep 5
    tap_mark 'calculator_invest_amount_seekbar'
  else
  end
end