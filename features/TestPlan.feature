Feature: Test plan sample
#  base url: "http://www.petsmart.com/"

  #TC-1
  Scenario: Main page functionality - header navigation
    Then Check that menu Dog category contains Dog submenu
    Then Check that menu Fish category contains Fish submenu
    Then Check that menu Bird category contains Bird submenu
    Then Check that menu Reptile category contains Reptile submenu
    Then Check that menu Small Pet category contains Small Pet submenu

  #TC-2
  Scenario: Main page functionality - footer navigation
    Then Check footer menu Services with items
    Then Check footer menu Cares with items
    Then Check footer menu Shop with items
    Then Check footer menu Education with items
    Then Check footer menu About with items

  #TC-3-8
  Scenario Outline: Main page functionality - external links
    Then Click on <social> icon <verification>
    Then Verify navigation to <verification>

  Examples:
    | social      | verification  |
    | Facebook    | PetSmart      |
    | Twitter     | Твиттер       |
    | Google Plus | Google+       |
    | Instagram   | Instagram     |
    | Pinterest   | Pinterest     |
    | YouTube     | YouTube       |

  #TC-9
  Scenario: Main page functionality - search - valid search
    Then In search type Food
    Then Check that Food returned

  #TC-10
  Scenario: Main page functionality - search - invalid search
    Then In search type qweweweewqe
    Then Check that no results returned or some message

  #TC-11
  Scenario: Main page functionality - pet services wrapper
    Then in Pet service click on each item and verify that all promo messages are different

  #TC-12
  Scenario: Dog - Food and health - Brands
    Then Click Dog menu
    Then In Featured Brands check that each brand navigates to the page with brand specific items

  #TC-13
  Scenario: Dog - Food and health - top categories
    Then Click Dog menu
    Then Check that each link in "Top Categories" works

  #TC-14
  Scenario: Dog - Food - see 200 items verification
    Then In Dog menu go to Food
    Then Click View 200 Items
    Then Check that 200 items displayed

  #TC-15
  Scenario: Dog - Food - pagination verification
    Then In Dog menu go to Food
    Then Go through all pages and print out all given items

  #TC-16
  Scenario: Dog - Food - sorting - price high to low
    Then In Dog menu go to Food
    Then Set sorting to Price: High to Low
    Then Verify selected item Price: High to Low
    Then Verify correct sorting Price: High to Low

  #TC-17
  Scenario: Dog - Food - sorting - price low to high
    Then In Dog menu go to Food
    Then Set sorting to Price: Low to High
    Then Verify selected item Price: Low to High
    Then Verify correct sorting Price: Low to High

  #TC-18
  Scenario: Dog - Food - sorting - top rated
    Then In Dog menu go to Food
    Then Set sorting to Top Rated
    Then Verify selected item Top Rated
    Then Verify correct Top Rated sorting

  #TC-19
  Scenario: Dog - Food - sorting - best sellers
    Then In Dog menu go to Food
    Then Set sorting to Best Sellers
    Then Verify selected item Best Sellers

  #TC-20
  Scenario: Dog - Food - sorting - new arrivals
    Then In Dog menu go to Food
    Then Set sorting to New Arrivals
    Then Verify selected item New Arrivals

  #TC-21
  Scenario: Dog - Food - filter - Brand
    Then In Dog menu go to Food
    Then Set filter for Brand and select Authority
    Then Check that Authority returned

  #TC-22
  Scenario: Dog - Food - filter - Flavor
    Then In Dog menu go to Food
    Then Set filter for Flavor and select Beef
    Then Verify Flavor sorting Beef

  #TC-23
  Scenario: Dog - Food - filter - Breed
    Then In Dog menu go to Food
    Then Set filter for Breed and select Boxer
    Then Check that Boxer returned

  #TC-24
  Scenario: Dog - Food - filter - Price
    Then In Dog menu go to Food
    Then Set filter for Price and select <$5
    Then Verify <$5 correct sorting

  #TC-25
  Scenario: Dog - Food - filter - Rating
    Then In Dog menu go to Food
    Then Set filter for Rating and select 2-3
    Then Verify correct 2-3 rate sorting

  #TC-26
  Scenario: Dog - Food - filter - Ways To Shop
    Then In Dog menu go to Food
    Then Set filter for More Ways To Shop and select Halloween

  #TC-27
  Scenario: Dog - Food - filter - Health Consideration
    Then In Dog menu go to Food
    Then Set filter for Health Consideration and select Active

  #TC-28
  Scenario: Dog - Food - comparing - adding 2 items
    Then In Dog menu go to Food
    Then Add 2 random items into compare mode
    Then Verify 2 random items is added

  #TC-29
  Scenario: Dog - Food - comparing - adding 3 items
    Then In Dog menu go to Food
    Then Add 3 random items into compare mode
    Then Verify 3 random items is added

  #TC-30
  Scenario: Dog - Food - comparing - adding more then 3 items
    Then In Dog menu go to Food
    Then Add 4 random items into compare mode

  #TC-31
  Scenario: Dog - Food - comparing - removing 1-3 items
    Then In Dog menu go to Food
    Then Add 3 random items into compare mode
    Then Remove one item from compare mode
    Then Remove one item from compare mode
    Then Remove one item from compare mode

  #TC-32
  Scenario: Dog - Shopping - 1 item to cart - all fine
    Then In Dog menu go to Food
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then Verify that quantity of items in the cart is equal to 1

  #TC-33
  Scenario: Dog - Shopping - 1 item to cart - size, quantity and flavor not selected
    Then In Dog menu go to Food
    Then Click random item
    Then Click Add to Cart button
    Then Verify error message displayed

  #TC-34
  Scenario: Dog - Shopping - 1 item to cart with removing
    Then In Dog menu go to Food
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then Verify that quantity of items in the cart is equal to 1
    Then Remove 1 item from the cart
    Then Verify that cart is empty

  #TC-35
  Scenario: Dog - Shopping - 1 item to cart with proceeding
    Then In Dog menu go to Food
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then Verify that quantity of items in the cart is equal to 1
    Then Click Secure checkout button and verify you are on Checkout page

  #TC-36
  Scenario: Dog - Shopping - more then 1 item to cart with removing of 1 item
    Then In Dog menu go to Food
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then In Dog menu go to Food
    Then Go to the next page
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then Verify that quantity of items in the cart is equal to 2
    Then Remove 1 item from the cart
    Then Verify that quantity of items in the cart is equal to 1




















