# Data Engineer Projects

These projects were created as part of [Codecademy's](https://www.codecademy.com) Data Engineer Career Path course. (Latest projects are added to the top of the list.)

There were several portfolio projects created as part of this course. As they were larger and more extensive programs they can be found in their own repositories:

- Portfolio Project: GitHub Data Engineering Portfolio (TODO)
- Portfolio Project: Subscriber Cancellations Data Pipeline (TODO)
- Portfolio Project: Bike Rental Data Management (TODO)

I have previously completed a number of the projects within [Python Fundamentals](#python-fundamentals) and all of the projects within [SQL Fundamentals](#sql-fundamentals) as part of [Codecademy's](https://www.codecademy.com) Computer Science Career Path course. For completeness, I have included the projects here as well, and have marked them with a \*.

## Table of contents

- Learn MongoDB
- Learn Git II: Git For Deployment
- Learn Git: Introduction To Version Control
- Advanced Python
- Learn The Command Line
- [Intermediate Python](#intermediate-python)
  - [The Nile](#the-nile)
- Introduction To Big Data With PySpark
- Getting Started Off-Platform
- Data Wrangling, Cleaning And Tidying
- Advanced SQL
- [Python Pandas](#python-pandas)
  - [Page Visits Funnel](#page-visits-funnel)
  - [A/B Testing For ShoeFly.com](#ab-testing-for-shoeflycom)
  - [Petal Power Inventory](#petal-power-inventory)
- [SQL Fundamentals](#sql-fundamentals) \*
  - [Building An Inventory Database With PostgreSQL](#building-an-inventory-database-with-postgresql) \*
  - [Designing A Database From Scratch](#designing-a-database-from-scratch) \*
  - [Build A Menu For Bytes Of China](#build-a-menu-for-bytes-of-china) \*
  - [Lyft Trip Data](#lyft-trip-data) \*
  - [Analyse Hacker News Trends](#analyse-hacker-news-trends) \*
  - [Trends In Startups](#trends-in-startups) \*
  - [New York Restaurants](#new-york-restaurants) \*
  - [Create A Table](#create-a-table) \*
- [Python Fundamentals](#python-fundamentals)
  - [Hacking The Fender](#hacking-the-fender) \*
  - [Coded Correspondence](#coded-correspondence)
  - [Thread Shed](#thread-shed) \*
  - [Abruptly Goblins](#abruptly-goblins)
  - [Scrabble](#scrabble) \*
  - [Basta Fazoolin'](#basta-fazoolin)
  - [Getting Ready For Physics Class](#getting-ready-for-physics-class) \*
  - [Time Travelers Toolkit](#time-travelers-toolkit)
  - [Carly's Clippers](#carlys-clippers) \*
  - [Len's Slice](#lens-slice) \*
  - [Gradebook](#gradebook) \*
  - [Sal's Shipping](#sals-shipping) \*
  - [Magic 8-Ball](#magic-8-ball) \*
- [Other](#other)
  - [Author](#author)

# Intermediate Python

## The Nile

This project focused on building functions that calculate shipping costs, identify the cheapest available driver, and total the revenue from completed trips. The main learning goal was practising how to work with and manipulate different types of arguments — unpacking tuples, using default parameters, and working with `*args` and `**kwargs`.

### 💡 Key Learning Points

#### Unpacking tuples

Coordinates needed to be unpacked so latitude and longitude values could be passed to calculate the distance:

```python
from_lat, from_long = from_coords
to_lat, to_long = to_coords
distance = get_distance(from_lat, from_long, to_lat,to_long)

# Equivalent shorthand:
distance = get_distance(*from_coords, *to_coords)
```

#### Using default parameters

Default arguments ensure functions behave sensibly when optional information isn’t supplied. In the shipping cost calculator, the default `shipping_type` was `'Overnight'`:

```python
def calculate_shipping_cost(from_coords, to_coords, shipping_type='Overnight'):
```

#### Flexible arguments with `*args` and `**kwargs`

Knowing when to use each is key:

- `*args` → any number of positional, unnamed values → stored as a tuple. Use when you don't know how many unnamed values will be passed.
  ```python
  def calculate_driver_cost(distance, *drivers):
    for driver in drivers:
      ...
  ```
- `**kwargs` → any number of keyword arguments, named values → stored as a dictionary. Use when values are passed with names (keys).
  ```python
  def calculate_money_made(**trips):
    for trip_id, trip in trips.items():
      ...
  ```

### 💻 Code & Potential Improvements

- Solution URL: [The Nile](./intermediate-python/the_nile.py)
- Other files:
  - [nile.py](./intermediate-python/nile.py)
  - [test.py](./intermediate-python/test.py)

# Python Pandas

## Page Visits Funnel

The aim of this project was to use Pandas to analyse data regarding a websites funnel for `visits.csv`, `cart.csv`, `checkout.csv` and `purchase.csv`. The funnel describes the process of:

1. A user visits the website
1. A user adds a product to the cart
1. A user clicks "checkout"
1. A user completes a purchase

### 💡 Key Learning Points

Analysis was done on each step of the funnel to see how many people continue through the funnel and ultimately make a purchase.

- `merge()` was used to help merge various DataFrames together e.g.

  ```python
  visits_cart = visits.merge(cart, how='left')
  ```

- `isnull()` was used to check which timestamps had `null` for that particular column, i.e. the user never went to the next funnel stage e.g.

  ```python
  null_purchases = len(checkout_purchase[checkout_purchase.purchase_time.isnull()])
  ```

### 💻 Code & Potential Improvements

- Solution URL: [Page Visits Funnel](./python-pandas/page_visits_funnel.py)
- Other files:
  - [visits.csv](./python-pandas/visits.csv)
  - [cart.sv](./python-pandas/cart.csv)
  - [checkout.csv](./python-pandas/checkout.csv)
  - [purchase.csv](./python-pandas/purchase.csv)

## A/B Testing For ShoeFly.com

The aim of this project was to use Pandas to analyse data from `adclicks.csv`. It is an A/B testing on the number of people clicking on the ads of a hypothetical website called ShoeFly.com They have two different versions of an ad, which they have placed in emails, on Facebook, Twitter, and Google. Analysis of the data for the two ads was done to see how they are performing on each of the different platforms and on each day of the week.

### 💡 Key Learning Points

- `groupby()` was used to help organise the data for analysis e.g.

  ```python
  ad_clicks_by_source = ad_clicks.groupby('utm_source').user_id.count().reset_index()
  ```

- `pivot()` was used to pivot the data in order to make it more readable e.g.

  ```python
  clicks_pivot = clicks_by_source.pivot(
    columns='is_click',
    index='utm_source',
    values='user_id'
  ).reset_index()
  print(clicks_pivot)
  ```

### 💻 Code & Potential Improvements

- Solution URL: [A/B Testing For ShoeFly.com](./python-pandas/ab_testing_shoefly.py)
- Other files:
  - [adclicks.csv](./python-pandas/ad_clicks.csv)
- I rounded the `percent_clicked` to 1dp in all the pivot tables where it was used e.g.

  ```python
  a_clicks_grouped['percent_clicked'] = round((a_clicks_grouped['user_id'] / a_clicks_grouped.groupby('day')['user_id'].transform('sum') * 100),1)
  ```

## Petal Power Inventory

The aim of this project was to use Pandas to analyse data from `inventory.csv`. A number of columns were added to the data to enhance the information that could be extracted from the data, and also making use of lambda functions:

- `in_stock` column: makes use of `quantity` column to work out whether in stock i.e. `True` or `False`.
- `total_value` column: makes use of `price` and `quantity` columns to calculate the total value.
- `full_description` column: makes use of and combines `product_type` and `product_description` columns to create a full description.

### 💡 Key Learning Points

```python
inventory['in_stock'] = inventory.quantity.apply(lambda quantity: True if quantity > 0 else False)

inventory['total_value'] = inventory.price * inventory.quantity

combine_lambda = lambda row: '{} - {}'.format(row.product_type, row.product_description)
inventory['full_description'] = inventory.apply(combine_lambda, axis=1)
```

### 💻 Code & Potential Improvements

- Solution URL: [Petal Blossom](./python-pandas/petal_blossom.py)
- Other files:
  - [inventory.csv](./python-pandas/inventory.csv)

# SQL Fundamentals

## Building An Inventory Database With PostgreSQL

The aim of this project was to set constraints on a database used for keeping track of parts, their manufacturer, location in storeroom, inventory etc, to enable data quality checks to ensure that only valid data can be entered into the database.

The database had the initial following schema:

![Schema for Building An Inventory Database With PostgreSQL database tables](./sql-fundamentals/schema_building_an_inventory_db.jpg)

To ensure data quality the following were utilised on the tables as appropriate:

- `ADD UNIQUE (column_name)`
- `ALTER COLUMN column_name SET NOT NULL`
- `ADD CHECK (appropriate limitation)`
- `ADD PRIMARY KEY (column_name)`
- `ADD FOREIGN KEY (column_name) REFERENCES table_name(column_name)`

### 💻 Code & Potential Improvements

- Solution URL: [Building An Inventory Database With PostgreSQL](./sql-fundamentals/building_an_inventory_database_with_postgresql.sql)

## Designing A Database From Scratch

The aims of this project were to:

- Design a database schema on any topic.
- Implement the schema using Postbird (which is an open source PostgreSQL GUI client).

I chose to design a database around a hypothetical UK secondary school. I focused the database around people who would be closely associated with the school and how they are linked together to decide on what information to add and how to organise it. I designed the following schema for the database (I've included the [DBML database markup language file](./sql-fundamentals/school.dbml)):

![Schema for school database tables](./sql-fundamentals/schema_school.png)

I got ChatGPT to generate hypothetical data based of the schema:

![Generated hypothetical data for school database tables](./sql-fundamentals/chatgpt_school_generated_data.jpg)

While using ChatGPT helped speed up the generation of data, it didn't keep the data consistent to what it was supposed to add for each individual. For instance, it added a staff member with a note to state they were an art teacher, but never added art teacher as a job. So there were some inconsistencies when trying to add the data that I needed to clear up when inserting data into the table.

### 💻 Code & Potential Improvements

- Solution URL: [Designing A Database From Scratch](./sql-fundamentals/school.sql)

- I added a few test queries to check that I could pull out information appropriately and as expected.

## Build A Menu For Bytes Of China

The aim of this project was to design a database schema based around a fictional restaurant "Bytes of China" and perform the following tasks:

- Create tables
- Define relationships between tables
- Designate appropriate columns as keys
- Insert sample data and
- Make queries from the database

The database has the following schema:

![Schema for Bytes of China database tables](./sql-fundamentals/schema_bytes_of_china.png)

I learnt how to use [dbdiagram.io](https://dbdiagram.io) to create an accurate schema and also how to validate and check keys and relationships in the database using `information_schema.key_column_usage`:

```sql
SELECT
   constraint_name,
   table_name,
   column_name
FROM information_schema.key_column_usage
WHERE table_name = 'restaurant';
```

### 💻 Code & Potential Improvements

- Solution URL: [Build A Menu For Bytes Of China](./sql-fundamentals/build_a_menu_for_bytes_of_china.sql)

## Lyft Trip Data

The aim of this project was make queries to a database containing multiple tables of Lyft trip data information using SQL commands knowledge to date and using `JOIN` and `UNION` commands. The database tables have the following schema:

![Schema for Lyft Trip Data database tables](./sql-fundamentals/schema_lyft_trip_data.jpg)

- Example use of `LEFT JOIN` where it was used to create a trip log with the trips and its users:
  ```sql
  SELECT trips.date,
    trips.pickup,
    trips.dropoff,
    trips.type,
    trips.cost,
    riders.first,
    riders.last,
    riders.username
  FROM trips
  LEFT JOIN riders
    ON trips.rider_id = riders.id;
  ```

### 💻 Code & Potential Improvements

- Solution URL: [Lyft Trip Data](./sql-fundamentals/lyft_trip_data.sql)

## Analyse Hacker News Trends

The aim of this project was make queries to a database table of Hacker News stories information using SQL commands knowledge to date and along with `strftime()` function. The database table has the following schema:

![Schema for Analyse Hacker News Trends database table](./sql-fundamentals/schema_analyse_hacker_news_trends.jpg)

- Example use of `strftime()` where it was used to find the best time for users to post news stories to get the best scores:
  ```sql
  SELECT strftime('%H', timestamp) AS 'Hour',
    ROUND(AVG(score), 1) AS 'Average Score',
    COUNT(*) AS 'Number of Stories'
  FROM hacker_news
  WHERE timestamp IS NOT NULL
  GROUP BY 1
  ORDER BY 2 DESC;
  ```

### 💻 Code & Potential Improvements

- Solution URL: [Analyse Hacker News Trends](./sql-fundamentals/analyse_hacker_news_trends.sql)

## Trends In Startups

The aim of this project was make queries using aggregate functions to a database table of startup companies information using SQL commands. The database table has the following schema:

![Schema for Trends In Startups database table](./sql-fundamentals/schema_trends_in_startups.jpg)

- Aggregate functions used: `COUNT()`, `SUM()`, `MAX()`, `MIN()`, `AVG()`, `ROUND()`
- `GROUP BY column_name;`
- `HAVING aggregrate function conditon;`

### 💻 Code & Potential Improvements

- Solution URL: [Trends In Startups](./sql-fundamentals/trends_in_startups.sql)

## New York Restaurants

The aim of this project was make queries to a database table of restaurant information using SQL commands. The database table has the following schema:

![Schema for New York Restaurants database table](./sql-fundamentals/schema_new_york_restaurants.jpg)

- `SELECT DISTINCT column_name FROM table_name;`
- `WHERE column_name condition;`
- `WHERE column_name LIKE pattern;`
- `WHERE column_name condition AND or OR column_name condition;`
- `WHERE column_name IS NULL;`
- `ORDER BY column_name DESC LIMIT number;`
- Also used `CASE`, `WHEN`, `THEN`, `ELSE`, `END AS`
  ```sql
  SELECT name,
    CASE
      WHEN review > 4.5 THEN 'Extraordinary'
      WHEN review > 4 THEN 'Excellent'
      WHEN review > 3 THEN 'Good'
      WHEN review > 2 THEN 'Fair'
      ELSE 'Poor'
    END AS 'Review'
  FROM nomnom;
  ```

### 💻 Code & Potential Improvements

- Solution URL: [New York Restaurants](./sql-fundamentals/new_york_restaurants.sql)

## Create A Table

The aim of this project was to create a friends table and add/delete data to it using basic SQL commands.

- `CREATE TABLE table_name (column_name data_type);`
- `INSERT INTO table_name (column_name) VALUES (data);`
- `SELECT column_name or * FROM table_name;`
- `UPDATE table_name SET column_name = data;`
- `ALTER TABLE table_name ADD COLUMN column_name data_type;`
- `DELETE FROM table_name WHERE column_name = data;`

### 💻 Code & Potential Improvements

- Solution URL: [Create A Table](./sql-fundamentals/create_a_table.sql)

# Python Fundamentals

## Hacking The Fender

The aim of this project was to create a Python program that reads and writes to files. Extracting `Username` information from `passwords.csv` to create a list of user names in `compromised_user.csv`. Creating `boss_message.json` and `new_passwords.csv`.

- Imported `csv`, `json` and `os`.
- `with open("file_name", "w")` used to write files, "w" omitted when using only for reading.
- `csv.DictReader()` used to read passwords.csv file.
- `json.dump(dictionary_name, json_file_name)` used to write information to json file from Python dictionary.
- `file_object.write("text_to_add")` used to write information to file.

### 💻 Code & Potential Improvements

- Solution URL: [Hacking The Fender](./python-fundamentals/hacking_the_fender.py)
- Other files:
  - [boss_message.json](./python-fundamentals/boss_message.json)
  - [compromised_users.txt](./python-fundamentals/compromised_users.txt)
  - [new_passwords.csv](./python-fundamentals/new_passwords.csv)
  - [passwords.csv](./python-fundamentals/passwords.csv)

## Coded Correspondence

The aim of this project was to write Python functions using Jupyter Notebook to code and decode messages using a [Caesar Cipher](https://en.wikipedia.org/wiki/Caesar_cipher) and a [Vigenère Cipher](https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher).

The Caesar Cipher is a simple offset cipher. However, I found the Vigenère Cipher more difficult to understand how to code as each letter has a different offset depending upon the key word used.

```python
def vigenere_decode(message, key):
  decoded_message = ""
  key_phrase = ""
  key_index = 0

  for char in message:
    if key_index >= len(key):
      key_index = 0
    if char in alphabet:
      key_phrase += key[key_index]
      key_index += 1
    else:
      key_phrase += char

  for i in range(len(message)):
    if message[i] in alphabet:
      old_char_index = alphabet.index(message[i])
      offset_index = alphabet.index(key_phrase[i])
      new_char = alphabet[(old_char_index + offset_index) % 26]
      decoded_message += new_char
    else:
      decoded_message += message[i]
  return decoded_message
```

### 💻 Code & Potential Improvements

- Solution URL: [Coded Correspondence](./python-fundamentals/coded_correspondence.ipynb)

## Thread Shed

The aim of this project was to create a Python program that takes a list of sales information in a string format (customer name, price, colour(s) of thread purchased and date), and then use a variety of techniques to clean up the data into easier-to-access information.

- `string.replace()` used to help with clarifying appropriate sales transaction.
- `string.split()` used to help split up string into appropriate sections.
- `string.strip()` used to clear up and remove whitespace in transaction information.
- `for` loops used to iterate through lists of transactions.
- `list.append` to add information into smaller appropriate groups of lists e.g. customers, sales price and colour of thread purchased.
- Function defined to calculate the total numbers sold for each colour thread.
- `print` and `.format()` used to print out a formatted string of the number of each colour thread purchased.

### 💻 Code & Potential Improvements

- Solution URL: [Thread Shed](./python-fundamentals/thread_shed.py)

## Abruptly Goblins

The aim of this project was to install [Jupyter Notebook](https://jupyter.org/) and use it to write a program to work out which night the most people can attend for a gamers night.

- `pip install notebook` and to run the notebook, I did `cd file_directory_name` and then `jupyter notebook` in the command line.

### 💻 Code & Potential Improvements

- Solution URL: [Abruptly Goblins](./python-fundamentals/Abruptly%20Goblins%20Planner.ipynb)

## Scrabble

The aim of this project was to create a Python program that processes some data from a group of friends playing scrabble. Dictionaries are used to organise players, words and points.

- List comprehension used to create a dictionary from two provided lists of letters and their points.

  ```python
  letters_to_points = {key:value for key, value in zip(letters, points)}
  ```

- Functions defined to:

  - `play_word()` adds a new word played by a player.

    - Sets `word.upper()` as letters in letters_to_points dictionary are all uppercase.
    - Sets `player.title()` so that if names are entered differently with lowercase or uppercase letters they will still match when compared to `player_to_words` dictionary.
    - If player already exists, word is added to their played list in player_to_words dictionary.
    - If player doesn't exist, then the new player along with their word is added to player_to_words dictionary.
    - Calls `update_point_totals()` function.

  - `update_point_totals()` updates the total points scored for the player.

    - Calls `score_word()` function.
    - If player already exists, points are added to their total score in player_to_points dictionary.
    - If player doesn't exist, then the new player along with their score is added to player_to_points dictionary.

  - `score_word()` calculates and returns the points score of a word.

  - `play_round()` initialises the program.

    - Gets player name and word from user.
    - Calls `play_word()` function.
    - Calls `another_round()` function.

  - `another_round()` asks user whether they wish to enter another player's word.

    - Gets Y/N input from user. Input changed to uppercase.
    - If response is `Y` or `YES`, then calls `play_round()` function.
    - If response not `Y` or `YES`, then calls `show_results()` function.

  - `show_results()` iterates through `player_to_points` dictionary to print out names and total scores of each player.

### 💻 Code & Potential Improvements

- Solution URL: [Scrabble](./python-fundamentals/scrabble.py)
  - Remove hardcoded player's data and ask for input of name and word from user - ADDED TO CODE.
  - Check whether more words to be added and scored - ADDED TO CODE.
  - Show overall results of players in formatted strings - ADDED TO CODE.

## Basta Fazoolin'

The aim of this project was to create a Python program that uses classes and functions to work out what menus are available at different times of day and to calculate bill costs. Classes defined for:

- Menu:
  - String representation for name of menu and when it is available
  - `calculate_bill()` calculates the cost of a particular meal
- Franchise:
  - String representation for name of restaurant
  - `available_menus()` works out which menus are currently available depending upon the time of day
- Business takes the name of the business and a list of its franchises.

### 💻 Code & Potential Improvements

- Solution URL: [Basta Fazoolin'](./python-fundamentals/basta_fazoolin.py)

## Getting Ready For Physics Class

The aim of this project was to create a Python program that uses functions and `return` to help calculate some fundamental physics properties.

- Functions defined to calculate:
  - Fahrenheit to Celsius temperatures
  - Celsius to Fahrenheit temperatures
  - Force
  - Energy
  - Work
- Values to test the program are hardcoded into the program.

### 💻 Code & Potential Improvements

- Solution URL: [Getting Ready For Physics Class](./python-fundamentals/getting_ready_physics_class.py)
  - Have the user choose which physics property to calculate.
  - Have the user enter appropriate values for the physics property they have chosen to calculate.

## Time Travelers Toolkit

The aim of this project was to create a Python program that uses imports and work with `datetime` to simulate time travel and to perform calculations using dates.

- Created custom module that was imported into the main script.
- Used list for possible destinations.
- Use of `random`, `decimal`, `datetime` to carry out calculations:

  ```python
  base_cost = Decimal('1000.00')
  current_year = current_date.year
  start_year = -2000
  end_year = 3500
  target_year = randint(start_year, end_year)
  cost_multiplier = abs(current_year - target_year)
  final_cost = round(base_cost * cost_multiplier, 2)
  ```

### 💻 Code & Potential Improvements

- Solution URL: [Time Travelers Toolkit](./python-fundamentals/time_travelers_toolkit.py)
- Other files:
  - [custom_module.py](./python-fundamentals/custom_module.py)

## Carly's Clippers

The aim of this project was to create a Python program that calculates some metrics from lists of data.

- Lists of hairstyles, prices and last week's sales are hardcoded into the program.
- `for`, list comprehensions, `range()`, `len()` and `if` are used to calculate average prices, decreased prices, total revenue, average daily revenue and types of haircuts that cost less than £30.

### 💻 Code & Potential Improvements

- Solution URL: [Carly's Clippers](./python-fundamentals/carlys_clippers.py)

## Len's Slice

The aim of this project was to create a Python program that takes pizzas and their prices using lists and alters the lists to organise the data.

- 2D lists of pizzas and prices are hardcoded into the program.
- `list.count(item)` used to count how many pizzas are $2.
- `len(list)` used to count the number of different kinds of pizzas.
- `list.sort()` to sort the list in ascending order of price.
- `list.pop()` to remove the most expensive pizza.
- `list.insert(index, item)` to add a new pizza in appropriate position to keep price sorted in list.
- `list[:3]` to find the cheapest three pizzas.

### 💻 Code & Potential Improvements

- Solution URL: [Len's Slice](./python-fundamentals/lens_slice.py)

## Gradebook

The aim of this project was to create a Python program that takes student data and organizes subjects and grades using lists.

- 2D lists of subjects and grades are hardcoded into the program.
- `list.append(item)`, `list[index].remove(item)` are used to alter subjects and grades and `print()` out gradebook information to the user.

### 💻 Code & Potential Improvements

- Solution URL: [Gradebook](./python-fundamentals/gradebook.py)
  - Have the user input the initial subjects and grades.
  - Have the user be able to alter subjects and grades.

## Sal's Shipping

The aim of this project was to create a Python program that asks the user for the weight of their package and then tells them which method of shipping is cheapest and how much it will cost to ship their package using Sal’s Shippers.

- `weight` variable is hardcoded into the program.
- `if`, `elif` and `else` used to calculate cost shipping and `print()` out costs.

### 💻 Code & Potential Improvements

- Solution URL: [Sal's Shipping](./python-fundamentals/shipping.py)
  - Have the user input the packages weight.

## Magic 8-Ball

The aim of this project was to create a Python program that can answer any "Yes" or "No" question with a different fortune each time it executes.

- `name` and `question` variables are hardcoded into the program.
- `random` module with `randint()` used to generate a random number within a specified range.
- `if`, `elif` and `else` used to select answers and `print()` out appropriate response.

### 💻 Code & Potential Improvements

- Solution URL: [Magic 8-Ball](./python-fundamentals/magic-8.py)
  - Have the user input their name and question.

# Other

## Author

- V. Tickner
