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

def sorting_price(prices, sorting)
  array_of_prices = prices.map{|m| m.text.gsub!("$", "").to_f}
  puts array_of_prices
  if sorting == "Price: High to Low"
    if array_of_prices != array_of_prices.sort.reverse
      raise "Sorting is not correct"
    else
      puts "Correct sorting"
    end
  elsif sorting == "Price: Low to High"
    if array_of_prices != array_of_prices.sort
      raise "Sorting is not correct"
    else
      puts "Correct sorting"
    end
  end
end

def array_of_prices_range(range)
  #return array with one or two float value (e.g. [5.0](<$5) or [15.0, 20.0]($15 - $20))
  if range.include? "-"
    range.gsub("$", "").split("-").map{|x| x.to_f}
  elsif range.include? "<"
    range = [range.gsub!(/[<$=]/, "").to_f]
    return range
  elsif range.include? ">"
    range = [range.gsub!(/[>]/, "").to_f]
    return range
  end
end

def compare_value_and_range(array, range)
  max_min_range = array_of_prices_range(range)
  for item_value in array
    if (max_min_range.count == 1 && max_min_range[0] == 1.0) || (max_min_range.count == 1 && max_min_range[0] == 5.0)
      if item_value > max_min_range[0]
        raise "#{item_value}" + " out of range " + "#{max_min_range[0]}"
      else
        puts "#{item_value}" + " in range " + "#{max_min_range[0]}"
      end
    elsif max_min_range.count == 1 && max_min_range[0] == 4.0
      if item_value < max_min_range[0]
        raise "#{item_value}" + " out of range " + "#{max_min_range[0]}"
      else
        puts "#{item_value}" + " in range " + "#{max_min_range[0]}"
      end
    elsif max_min_range.count == 2
      if item_value < max_min_range[0] && item_value > max_min_range[1]
        raise  "#{item_value}" + " out of range " + "#{max_min_range[0]}" + " - " + "#{max_min_range[1]}"
      else
        puts "#{item_value}" + " in range " + "#{max_min_range[0]}" + " - " + "#{max_min_range[1]}"
      end
    end
  end
end
#========================================================================================|