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

  Scenario: Dog - Food and health - Brands
    Then In "Dog" menu go to "Food & health"
    Then In "Featured Brands" check that each brand navigates to the page with brand specific items

  Scenario: Dog - Food and health - top categories
    Then In "Dog" menu go to "Food & health"
    Then Check that each link in "Top Categories" works

  Scenario: Dog - Food - see 200 items verification
    Then In "Dog" menu go to "Food"
    Then Click "View 200 Items"
    Then Check that 200 items displayed

  Scenario: Dog - Food - pagination verification
    Then In "Dog" menu go to "Food"
    Then Go through all pages and print out all given items

  Scenario: Dog - Food - sorting - price high to low
    Then In "Dog" menu go to "Food"
    Then Set sorting to "price high to low"
    Then Verify correct sorting

  Scenario: Dog - Food - sorting - price low to high
    Then In "Dog" menu go to "Food"
    Then Set sorting to "price low to high"
    Then Verify correct sorting

  Scenario: Dog - Food - sorting - top rated
    Then In "Dog" menu go to "Food"
    Then Set sorting to "top rated"
    Then Verify correct sorting

  Scenario: Dog - Food - sorting - best sellers
    Then In "Dog" menu go to "Food"
    Then Set sorting to "best sellers"
    Then Verify correct sorting

  Scenario: Dog - Food - sorting - new arrivals
    Then In "Dog" menu go to "Food"
    Then Set sorting to "new arrivals"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Brand
    Then In "Dog" menu go to "Food"
    Then Set filter for "Brand"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Flavor
    Then In "Dog" menu go to "Food"
    Then Set filter for "Flavor"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Breed
    Then In "Dog" menu go to "Food"
    Then Set filter for "Breed"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Price
    Then In "Dog" menu go to "Food"
    Then Set filter for "Price"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Rating
    Then In "Dog" menu go to "Food"
    Then Set filter for "Rating"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Ways To Shop
    Then In "Dog" menu go to "Food"
    Then Set filter for "Ways to Shop"
    Then Verify correct sorting

  Scenario: Dog - Food - filter - Health Consideration
    Then In "Dog" menu go to "Food"
    Then Set filter for "Health Consideration"
    Then Verify correct sorting

  Scenario: Dog - Food - comparing - adding 2 items
    Then In "Dog" menu go to "Food"
    Then Add 2 random items into compare mode

  Scenario: Dog - Food - comparing - adding 3 items
    Then In "Dog" menu go to "Food"
    Then Add 3 random items into compare mode

  Scenario: Dog - Food - comparing - adding more then 3 items
    Then In "Dog" menu go to "Food"
    Then Add 4 random items into compare mode

  Scenario: Dog - Food - comparing - removing 1-3 items
    Then In "Dog" menu go to "Food"
    Then Add 3 random items into compare mode
    Then Remove one item from compare mode
    Then Remove one item from compare mode
    Then Remove one item from compare mode

  Scenario: Dog - Shopping - 1 item to cart - all fine

  Scenario: Dog - Shopping - 1 item to cart - size, quantity and flavor not selected

  Scenario: Dog - Shopping - 1 item to cart with removing

  Scenario: Dog - Shopping - 1 item to cart with proceeding

  Scenario: Dog - Shopping - more then 1 item to cart with removing of 1 item




















