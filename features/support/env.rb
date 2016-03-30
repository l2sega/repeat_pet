require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'

Before do
  $driver = Selenium::WebDriver.for :firefox
  $mainurl = "http://www.petsmart.com/"
  $driver.get $mainurl
end

#After do
#  $driver.quit
#end

#=========FUNCTIONS======================================================================|

def compare_arrays(basic, result)
  if basic == result
    puts "Congratulation arrays are the same"
  else
    puts basic
    puts result
    raise "Ooo-nooooooo"
  end
end

#========================================================================================|