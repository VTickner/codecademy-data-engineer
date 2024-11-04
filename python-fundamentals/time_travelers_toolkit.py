#3. Create time_travelers_toolkit.py
#4. Import datetime with alias dt, import Decimal, randint and choice 
import datetime as dt
from decimal import Decimal
from random import randint, choice
import custom_module

# 5. Use datetime to get current date and time
current_date = dt.date.today()
current_time = dt.datetime.now().time()

# 6. Print current date and time
print(f"Current date is {current_date} and the current time is {current_time}.")

# 7. Calculate the final cost of time travel, create base cost as Decimal object, cost multiplier which is difference between current year and target year.
# 8. Final cost to be to two decimal places.
# 9. Use randint() to create a target year between two values.
base_cost = Decimal('1000.00')
current_year = current_date.year
start_year = -2000
end_year = 3500
target_year = randint(start_year, end_year)
cost_multiplier = abs(current_year - target_year)
final_cost = round(base_cost * cost_multiplier, 2)

# 10. Create a list of possible destinations, then use choice() to randomly select from the list.
destinations = ["Egypt", "Europe", "America", "The Moon", "Future Mars Colony", "China", "London", "20,000 Leagues Under The Sea"]
selected_destination = choice(destinations)

# 11. Use target_year, final_cost and selected_destination as arguments for the generate_time_travel_message() and print message.
print(custom_module.generate_time_travel_message(target_year, selected_destination, final_cost))