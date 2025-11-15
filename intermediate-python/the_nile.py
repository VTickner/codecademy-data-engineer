from nile import get_distance, format_price, SHIPPING_PRICES
from test import test_function

def calculate_shipping_cost(from_coords, to_coords, shipping_type='Overnight'):
    from_lat, from_long = from_coords
    to_lat, to_long = to_coords
    distance = get_distance(from_lat, from_long, to_lat,to_long)
    # distance = get_distance(*from_coords, *to_coords)
    shipping_rate = SHIPPING_PRICES[shipping_type]
    price = distance * shipping_rate
    return format_price(price)

# Test calculate_shipping_cost() function by calling 
test_function(calculate_shipping_cost)


def calculate_driver_cost(distance, *drivers):
    cheapest_driver = None
    cheapest_driver_price = None
    for driver in drivers:
        driver_time = distance / driver.speed
        price_for_driver = driver.salary * driver_time
        if cheapest_driver == None:
            cheapest_driver = driver
            cheapest_driver_price = price_for_driver
        elif price_for_driver < cheapest_driver_price:
            cheapest_driver = driver
            cheapest_driver_price = price_for_driver
    return cheapest_driver_price, cheapest_driver

# Test calculate_driver_cost() function by calling 
test_function(calculate_driver_cost)


def calculate_money_made(**trips):
  total_money_made = 0
  for trip_id, trip in trips.items():
    trip_revenue = trip.cost - trip.driver.cost
    total_money_made += trip_revenue
  return total_money_made

# Test calculate_money_made() function by calling 
test_function(calculate_money_made)
