require 'calabash-android/management/app_installation'
require 'calabash-android/management/adb'
require 'calabash-android/operations'
include Calabash::Android::Operations
require 'yaml'
$Configuration = YAML.load_file "setup.cfg"


$temp = 1
def android_LaunchClient(session)
  ENV["ADB_DEVICE_ARG"]=$Configuration[session+"Device"].to_s
  puts $Configuration[session+"Device"].to_s
  i = 3000+$temp
  ENV["TEST_SERVER_PORT"]=i.to_s
  begin
    remove_instance_variable(:@default_device)
  rescue
  end
  /uninstall_apps()
  install_app(ENV["TEST_APP_PATH"])
  install_app(ENV["APP_PATH"])/
  x1=default_device
  set_default_device(x1)
  if defined? $session
    h1 = {session => x1}
    $session=$session.merge(h1)
  else
    $session = {session => x1}
  end
  
  start_test_server_in_background()
  $temp=$temp+1
  sleep 10
  #touch("* id:'row_middle_text' * text:'"+$Configuration["serviceSelection"].to_s+"'")
end



def android_GetClientStatus(session)
  if defined? $session
    if $session.has_key?(session)
      return "Active"
    else
      return "InActive"
    end
  else
    return "InActive"
  end
  return "Active"
end


def CheckClientstatus(session)
  if $Configuration[session+"DeviceType"] == "Android"
    if (android_GetClientStatus(session) == "InActive")
      android_LaunchClient(session)
      ##puts "2222"
    else
    end
  else
    puts "Not supported on IOS"
  end
end
begin
  CheckClientstatus("S1")
  #CheckClientstatus("S2")
rescue
end

AfterConfiguration do |config|
	FeatureNameMemory.feature_name = nil
end

Before do |scenario|
  @scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
  if @scenario_is_outline 
    scenario = scenario.scenario_outline 
  end 

  feature_name = scenario.feature.title
  if FeatureNameMemory.feature_name != feature_name \
      or ENV["RESET_BETWEEN_SCENARIOS"] == "1"
    if ENV["RESET_BETWEEN_SCENARIOS"] == "1"
      log "New scenario - reinstalling apps"
    else
      log "First scenario in feature - reinstalling apps"
    end
    /uninstall_apps
    install_app(ENV["TEST_APP_PATH"])
    install_app(ENV["APP_PATH"])/
    FeatureNameMemory.feature_name = feature_name
	FeatureNameMemory.invocation = 1
  else
    FeatureNameMemory.invocation += 1
  end
end

FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name, :invocation
end
