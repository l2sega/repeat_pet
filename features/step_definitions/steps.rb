Then /^Check that menu ([^"]*) category contains ([^"]*) submenu$/ do |x, y|
  menu = $driver.find_element(:xpath, "//ul[@class = 'ws-common-list pet-main-nav']/li[.//span[text() = '#{x}'] or .//a[text() = '#{y}']][1]")
  $driver.mouse.move_to menu
  submenue = $driver.find_elements(:xpath, "//ul[.//div[contains(@class, 'main-nav-dropdown-dog')]][.//a[contains(*, '#{x}')]]//h1[text() = '#{y}']")
  if submenue.count > 0
    puts "Element found"
  else
    raise "Oups"
  end
end

Then /^Check footer menu ([^"]*) with items$/ do |x|
  services = ['PetsHotel Boarding', 'Doggie Day Camp', 'Pet Grooming', 'Dog Training', 'Pet Expressions', 'Banfield Vet Services', 'Local Ad']
  cares = ['Adopt A Pet', 'PetSmart Charities', '– Donate', '– Volunteer', 'PetSmart Gives Back']
  shop = ['Shop by Brand', 'PetPerks', 'Gift Cards & eCertificates', 'No-Hassle Return Policy', 'Track Your Order', 'Pharmacy', 'Product Recalls', 'In Store Pickup']
  education = ['Food Center', 'Puppy Center', 'Care Guides', 'Fish Center', 'Small Pet Center', 'Reptile Center', 'Bird Center', 'Did You Know? Video Center']
  about = ['Careers', 'Company Information', 'News Room', 'Event Sponsorship', 'Affiliate Program', 'Site Map', 'Mobile Site', 'Compliance & Ethics']

  foot_menu = $driver.find_elements(:xpath, "//div[contains(@class, 'links-group')][./div[contains(*, '#{x}')]]//a")
  result = foot_menu.map!{|i| i.text}

  case
    when x == 'Services' then compare_arrays(services, result)
    when x == 'Cares' then compare_arrays(cares, result)
    when x == 'Shop' then compare_arrays(shop, result)
    when x == 'Education' then compare_arrays(education, result)
    when x == 'About' then compare_arrays(about, result)
    else
      raise "No valid array"
  end
end

Then /^Click on ([^"]*) icon ([^"]*)$/ do |name, verif|
  group_of_social = $driver.find_element(:xpath, "//ul[contains(@class, 'pet-footer-social-list')]/li/a[text() = '#{name}']")
  group_of_social.click
  not_redirect = ['Instagram', 'Pinterest']
  if not_redirect.include? name
    if $driver.title.include? verif
      puts "Element detected"
    else
      raise "No element"
    end
  end
end

Then /^Verify navigation to (.*)$/ do |verif|
  $driver.switch_to.window $driver.window_handles.last
  if $driver.title.include? verif
    puts "Element detected"
  else
    raise "No element"
  end
  $driver.close
end

Then /^In search type ([^"]*)$/ do |x|
  search = $driver.find_element(:id, "searchForm")
  search.send_keys x
  sbutton = $driver.find_element(:xpath, "//*[@class = 'ws-search-submit']")
  sbutton.click
  sleep 2
end

Then /^Check that ([^"]*) returned$/ do |x|
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  for i in items do
    if i.text.include? x
      puts i.text
    else
      raise "Your element did not find"
    end
  end
end

Then /^Check that no results returned or some message$/ do
  error_message = $driver.find_elements(:xpath, "//h1[@class = 'ws-heading'][contains(text(), '0 Results for:')]")
  if error_message.count > 0
    puts "Error message displayes"
  else
    raise "No error message - BUG"
  end
end

Then /^in Pet service click on each item and verify that all promo messages are different$/ do
  elements = $driver.find_elements(:xpath, "//div[@id = 'services-pagination']/div[contains(@class, 'owl-page')]")
  array_of_messages = []
  message = $driver.find_elements(:xpath, "//div[@class = 'service-content']/p[@class = 'titleLower']")
  n = 0
  for i in elements do
    i.click
    sleep 2
    array_of_messages.push(message[n].text)
    n += 1
  end
  if array_of_messages == array_of_messages.uniq
    puts array_of_messages
    puts array_of_messages.uniq
  else
    raise "Your messages NOT uniq"
  end
end

Then /^Click ([^"]*) menu$/ do |x|
  element = $driver.find_element(:xpath, "//li[@class = 'ws-common-list-item pet-main-nav-item-level1']//span[@class = 'ws-category-title' and text() = '#{x}']")
  element.click
end

Then /^In Featured Brands check that each brand navigates to the page with brand specific items$/ do
  list_of_brands = $driver.find_elements(:xpath, "//div[@class = 'ws-group-contents']/div[contains(@class, 'content-row--content-width spacer__bottom--tiny')]//img")

  for i in 0..list_of_brands.length-1
    brand = $driver.find_element(:xpath, "(//div[@class = 'ws-group-contents']/div[contains(@class, 'content-row--content-width spacer__bottom--tiny')]//img)["+(i+1).to_s+"]")
    b = brand.attribute('alt')
    brand.click
    puts b

    items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
    for item in items
      if item.text.include? b.capitalize or b.upcase or b.downcase
        next
      else
        raise "Item not found"
      end
    end
    $driver.navigate.back
  end
end

Then /^Check that each link in "Top Categories" works$/ do
  top_list = $driver.find_elements(:xpath, "(//div[contains(@class, 'content-width clearfix')])[position() < 3]//a")
  for i in 0..top_list.length-1
    top_list = $driver.find_element(:xpath, "((//div[contains(@class, 'content-width clearfix')])[position() < 3]//a)["+(i+1).to_s+"]")
    category = top_list.text
    puts category
    top_list.click
    sleep 2
    title = $driver.find_elements(:xpath, "//div[contains(@class, 'pet-family-title-contents')]/h3[text() = '"+category+"']")
    if title.count > 0
      puts title[0].text + " is found"
    else
      raise "Title is not found"
    end
    $driver.navigate.back
    sleep 2
  end
end

#14
Then /^In ([^"]*) menu go to ([^"]*)$/ do |x, y|
  element1 = $driver.find_element :xpath => "//a[./span[@class = 'ws-category-title' and text() = '#{x}']]"
  $driver.mouse.move_to element1
  element2 = $driver.find_element :xpath => "//div[contains(@class, 'main-nav-dropdown-dog-contents')]//ul/li/a[.//text() = '#{y}']"
  element2.click
end

Then /^Click View 200 Items$/ do
  view_200 = $driver.find_element(:xpath, "//div[@class = 'ws-group-contents pet-pagination-contents']/a")
  view_200.click
end

Then /^Check that ([^"]*) items displayed$/ do |count|
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  if items.count == count.to_i
    puts "All " + count + " items is found"
  else
    #puts items.count
    raise "Inconsistency"
  end
end

#TC-15
Then /^Go through all pages and print out all given items$/ do
  count = 2
  next_button = $driver.find_elements(:xpath, "//li[contains(@class, 'list-next-page ws-active')]")
  page = $driver.find_elements(:xpath, "((//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2])/li/a[contains(@title, '"+count.to_s+"')]")
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  puts items.map{|x| x.text}

  while next_button.count > 0
    page[0].click
    sleep 2
    items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
    puts items.map{|x| x.text}
    puts count
    count += 1
    page = $driver.find_elements(:xpath, "((//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2])/li/a[contains(@title, '"+count.to_s+"')]")
    next_button = $driver.find_elements(:xpath, "//li[contains(@class, 'list-next-page ws-active')]")
  end
end

Then /^Set sorting to ([^"]*)$/ do |x|
  select = $driver.find_element(:xpath, "(//select[@name = 'SortingAttribute'])[1]")
  dd = Selenium::WebDriver::Support::Select.new(select)
  dd.select_by(:text, x)
  sleep 2
end

Then /^Verify selected item ([^"]*)$/ do |x|
  select = $driver.find_element(:xpath, "(//select[@name = 'SortingAttribute'])[1]")
  dd = Selenium::WebDriver::Support::Select.new(select)
  if dd.first_selected_option.text == x
    puts x + " is found"
  else
    raise "No element"
  end
end

Then /^Verify correct sorting ([^"]*)$/ do |x|
  prices = $driver.find_elements(:xpath, "//ul[contains(@class, 'compare')]//div[contains(@class, 'pet-prodloopSM')]/span")
  sorting_price(prices, x)
end

Then /^Verify correct Top Rated sorting$/ do
  rating = $driver.find_elements(:xpath, "//ul[contains(@class, 'compare')]//div[contains(@class, 'ws-group pet-prodloop-rating-group-stars rating')]//span")
  arr_rating = rating.map {|x| x.text.to_f}
  puts arr_rating

  if arr_rating != arr_rating.sort.reverse
    raise "Sorting is not correct"
  else
    puts "Correct sorting"
  end
end

#TC-21
Then /^Set filter for ([^"]*) and select (.*)$/ do |x, y|
  show_all = $driver.find_element(:xpath, "//div[@class = 'ws-filters ws-section'][.//legend[contains(text(), '"+x+"')]]//a[text() = 'Show all']") rescue false
  if show_all
    show_all.click
    sleep 1
  end
  filter = $driver.find_element(:xpath, "//div[..//legend[contains(text(), '#{x}')]]//li[@class = 'ws-filter'][.//label[text() = '#{y}']]//input")
  filter.click
end

#TC-22
Then /^Verify Flavor sorting ([^"]*)$/ do |flavor|
  #flavors = $driver.find_elements(:xpath, "//label[@for = 'variationId_Flavor']/span[@class = 'kor-selection-value']")
  #flavors = $driver.find_elements(:xpath, "//li[contains(@data-variation-value, 'Beef')]/span[normalize-space(contains(text(), 'Beef'))]")
  flavors = $driver.find_elements(:xpath, "//li[contains(@data-variation-value, 'Beef')]/span")
  #for i in flavors
    #puts i.attribute('data-variation-value')
    #count +=1
    #puts i.text
    #puts i.attribute('textContent')
    #puts i.attribute('innerHTML')
  #end
  arr_flavor = flavors.map {|x| x.attribute('innerHTML').gsub(/[\t\n]/, "")}
  #arr_flavor = flavors.map {|x| x.attribute('innerHTML').match("Beef")}
  puts arr_flavor

  for i in arr_flavor
    if i.include? flavor
      next
    else
      raise flavor + " is not found"
    end
  end
end

Then /^Verify (.*) correct sorting$/ do |range|
  prices = $driver.find_elements(:xpath, "//ul[contains(@class, 'compare')]//div[contains(@class, 'pet-prodloopSM')]/span")
  arr_prices = prices.map{|m| m.text[/[^to]+/].gsub!(/[$ ]/, "").to_f}
  compare_value_and_range(arr_prices, range)
end

Then /^Verify correct (.*) rate sorting$/ do |r|
  rate = $driver.find_elements(:xpath, "//ul[contains(@class, 'ws-product-list pet-product')]//div[contains(@class, 'rating')]/div/span")
  arr_rate = rate.map{|m| m.text.to_f.round(1)}
  compare_value_and_range(arr_rate, r)
end

#TC-28
Then /^Add ([^"]*) random items into compare mode$/ do |number|
  #compare_chbox = $driver.find_elements(:xpath, "//div[@class = 'ws-compare-link-add-container']//input[@class = 'ws-compare-link-checkbox']")
  compare_chbox = $driver.find_elements(:xpath,"//div[@class = 'ws-group pet-prodloop'][.//h4[@class = 'ws-product-title fn']]//a[contains(@class, 'pet-prodloop-compare-add') and contains(text(), 'Compare')]")
  for i in compare_chbox.sample(number.to_i)
    puts i.attribute('href')
    i.click
    sleep 5
  end

  #for i in 0..number.to_i-1
  #  x = compare_chbox.sample
  #  puts x.attribute('href')
  #  x.click
  #  sleep 3
  #end

  if number.to_i >= 4
    error_msg = $driver.find_elements(:xpath, "//div[contains(text(), 'You may only add up to 3')]")
    if error_msg.count > 0
      puts "Error message displayed"
    else
      raise "No error message"
    end
  end
end

Then /^Verify ([^"]*) random items is added$/ do |number|
  items = $driver.find_elements(:xpath, "//div[@class = 'kor-product-photo']/a[@class = 'url kor-product-link pet-compare-img']")
  if items.count == number.to_i
    puts "Added " + number + " items"
  else
    raise "Incomplete list"
  end
end

Then /^Remove one item from compare mode$/ do
  compare_list = $driver.find_elements(:xpath, "//ul[@class = 'ws-product-list pet-compare-list']//a[contains(@class, 'link-remove')]")
  compare_list[0].click
end

#TC-32
Then /^Click random item$/ do
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  items.sample.click
end

Then /^Select ([^"]*) Size and ([^"]*) Flavor if not selected by default$/ do |size_n, flavor_n|
  size = $driver.find_element(:xpath, "//div[contains(@aria-labelledby, 'List_SizeCode')]//div[@class = 'kor-select-text-viewport-contents']") rescue false
  if size
    size.click
    sub_size = $driver.find_element(:xpath, "//ul[contains(@class, 'list-SizeCode')]/li["+(size_n.to_i+1).to_s+"]")
    sub_size.click
    sleep 2
  end

  flavor = $driver.find_element(:xpath, "//div[contains(@aria-labelledby, 'List_Flavor')]//div[@class = 'kor-select-text-viewport-contents']") rescue false
  if flavor
    flavor.click
    sub_flavor = $driver.find_element(:xpath, "//ul[contains(@class, 'Flavor')]/li["+(flavor_n.to_i+1).to_s+"]")
    sub_flavor.click
    sleep 2
  end
end

Then /^Click Add to Cart button$/ do
  add_cart = $driver.find_element(:xpath, "//button[contains(@class, 'ws-add-to-cart-submit')]")
  add_cart.click
  sleep 3
end

Then /^Verify that quantity of items in the cart is equal to ([^"]*)$/ do |number|
  cart = $driver.find_element(:xpath, "//span[@class = 'ws-running-items' and text() = 'Cart:']")
  $driver.mouse.move_to cart
  sleep 3
  count_items = $driver.find_element(:xpath, "//div[@class = 'kor-minicart kor-overlay kor-tip']//span[contains(@class, 'items-amount')]")

  if count_items.text == number
    puts "Quantity is consistent with cart"
  else
    raise "Quantity is different"
  end
end

Then /^Verify error message displayed$/ do
  size = $driver.find_element(:xpath, "//div[contains(@aria-labelledby, 'List_SizeCode')]//div[@class = 'kor-select-text-viewport-contents']") rescue false
  flavor = $driver.find_element(:xpath, "//div[contains(@aria-labelledby, 'List_Flavor')]//div[@class = 'kor-select-text-viewport-contents']") rescue false

  if size || flavor
    message = $driver.find_elements(:xpath, "//div[contains(@class, 'pet-page-level-error-text-heading') and text() = 'Please correct the error(s) indicated below.']")
    if message.count > 0
      puts "Error message is displayed"
    else
      raise "No error message"
    end
  end
end

Then /^Remove 1 item from the cart$/ do
  remove = $driver.find_element(:xpath, "//button[@class = 'ws-remove ws-cart-remove']")
  remove.click
end

Then /^Verify that cart is empty$/ do
  cart = $driver.find_element(:xpath, "//a[contains(@class, 'ws-minicart-link')]")
  $driver.mouse.move_to cart
  empty_cart = $driver.find_element(:xpath, "//p[contains(text(), 'empty')]")rescue false
  if empty_cart
    puts "Cart is empty"
  else
    raise "Cart is no empty"
  end
end

Then /^Click Secure checkout button and verify you are on Checkout page$/ do
  checkout_button = $driver.find_element(:xpath, "//button[@name = 'secureCheckout']")
  checkout_button.click
  sleep 2
  checkout_page = $driver.find_element(:xpath, "//h3[@class = 'ws-heading ' and text() = 'Checkout']")rescue false
  if checkout_page
    puts "Page displayed"
  else
    raise "No checkout page"
  end
end

Then /^Go to the next page$/ do
  next_page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  next_page.click
  sleep 2
end