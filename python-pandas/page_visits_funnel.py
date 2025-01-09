import pandas as pd

visits = pd.read_csv('visits.csv', parse_dates=[1])
cart = pd.read_csv('cart.csv', parse_dates=[1])
checkout = pd.read_csv('checkout.csv', parse_dates=[1])
purchase = pd.read_csv('purchase.csv', parse_dates=[1])

# 1. Inspect the DataFrames using print and head
# - List all users who have visited the website
print(visits.head())
# - List all users who added a t-shirt to their cart
print(cart.head())
# - List all users who have started the checkout
print(checkout.head())
# - List all users who have purchased a t-shirt
print(purchase.head())

# 2. Combine visits and cart using a left merge
visits_cart = visits.merge(cart, how='left')
print(visits_cart.head())

# 3. How long is visits_cart?
total_visits = len(visits_cart)
print(total_visits)
# total_visits = 2000

# 4. How many timestamps are null for the column cart_time?
null_cart_times = len(visits_cart[visits_cart.cart_time.isnull()])
print(null_cart_times)
# null_cart_times = 1652

# 5. % of visitors who did not place an order (use float for either numerator or denominator to not use integer division)
percent_only_visited = float(null_cart_times) / float(total_visits) * 100
print(percent_only_visited)
# percent_not_purchase = 82.6%

# 6. Combine cart and checkout using a left merge and count null values. % of users who put items in their cart but did not checkout
cart_checkout = cart.merge(checkout, how='left')
print(cart_checkout.head())
null_checkouts = len(cart_checkout[cart_checkout.checkout_time.isnull()])
print(null_checkouts)
# null_checkouts = 122
percent_not_checkout = float(null_checkouts) / float(len(cart)) * 100
print(round(percent_not_checkout,1))
# percent_not_checkout = 35.1%

# 7. Merge all four steps, in order, of the funnel using left merges.
all_data = visits_cart.merge(checkout, how='left').merge(purchase, how='left')
print(all_data.head())

# 8. % of users who proceeded to checkout but did not purchase
checkout_purchase = checkout.merge(purchase, how='left')
num_checkouts = len(checkout_purchase)
null_purchases = len(checkout_purchase[checkout_purchase.purchase_time.isnull()])
percent_checkout_not_purchase = float(null_purchases) / float(num_checkouts) * 100
print(round(percent_checkout_not_purchase,1))
# percent_checkout_not_purchase = 16.9%

# 9. Which step of the funnel is the weakest (highest percentage of users not completing it)
print(f"{round(percent_only_visited, 1)} percent of users who visited the page did not add a t-shirt to their cart")
print(f"{round(percent_not_checkout, 1)} percent of users who added a t-shirt to their cart did not checkout")
print(f"{round(percent_checkout_not_purchase, 1)} percent of users who made it to checkout  did not purchase a shirt")
# 82.6%, 35.1% and 16.9%
# The weakest step is clearly adding a t-shirt to a persons cart. Possible improvements would be detailed description, good product photos and most importantly making the add to cart button easy to spot on the product listing page.

# 10. Using all_data add a column that is the difference between purchase_time and visit_time
all_data['visit_to_purchase_time'] = all_data.purchase_time - all_data.visit_time

# 11. Print the new column to the screen
print(all_data.visit_to_purchase_time)

# 12. Calculate the average time to purchase by using mean() against column visit_to_purchase_time
avg_time_to_purchase = all_data.visit_to_purchase_time.mean()
print(avg_time_to_purchase)
# avg_time_to_purchase = 0 days 00:43:53.360160