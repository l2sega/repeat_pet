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