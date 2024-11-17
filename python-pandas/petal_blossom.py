import pandas as pd

# 1. Load the inventory.csv
inventory = pd.read_csv('inventory.csv')

# 2. Inspect the first 10 rows
print(inventory.head(10))

# 3. First 10 rows represent Staten Island location, save them separately
staten_island = inventory.head(10)

# 4. What products are sold at Staten Island location?
product_request = staten_island.product_description

# 5. What types of seeds are sold at Brooklyn location?
seed_request = inventory[(inventory.location == 'Brooklyn') & (inventory.product_type == 'seeds')]

# 6. Add column in_stock, set True or False based on quantity
inventory['in_stock'] = inventory.quantity.apply(lambda quantity: True if quantity > 0 else False)

# 7. Add column total_value, equal to price * quantity
inventory['total_value'] = inventory.price * inventory.quantity

# 8. Add lambda function combining product_type and product_description
combine_lambda = lambda row: \
  '{} - {}'.format(row.product_type, row.product_description)

# 9. Use combine_lambda to add column full_description
inventory['full_description'] = inventory.apply(combine_lambda, axis=1)

# Showing all changes
print(inventory.head(10))