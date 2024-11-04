# 1. Create a menu class
class Menu:
  # 2. Give menu a constructor with self, name, items, start_time, end_time
  def __init__(self, name, items, start_time, end_time):
    self.name = name
    self.items = items
    self.start_time = start_time
    self.end_time = end_time
  
  # 7. Give menu a string representation method, that will say the name of the menu and when it is available
  def __repr__(self):
    return f"The {self.name} menu is available from {self.start_time if self.start_time <= 12 else self.start_time - 12}{'am' if self.start_time < 12 else 'pm'} to {self.end_time if self.end_time <= 12 else self.end_time - 12}{'am' if self.end_time < 12 else 'pm'}"
  
  # 9. Give menu a method .calculate_bill() with seld, purchased_items (which is a list)
  def calculate_bill(self, purchased_items):
    total_price = 0
    for item in purchased_items:
      if item in self.items:
        total_price += self.items[item]
    return round(total_price, 2)

# 12. Create more than one restaurant by creating a franchise class
class Franchise:
  # 13. Give franchise a constructor with self, address, menus
  def __init__(self, address, menus):
    self.address = address
    self.menus = menus

  # 15. Give franchise a string representation method, that will say the address of the restaurant
  def __repr__(self):
    return f"The {self.address} restaurant has the folllowing menus {self.menus}"
  
  # 16. Give franchise a method .available_menus() that takes a time parameter and returns a list of menu objects that are available
  def available_menus(self, time):
    available_menu = []
    for menu in self.menus:
      if menu.start_time <= time < menu.end_time:
        available_menu.append(menu)
    return available_menu

# 19. Create a Business class
class Business:
  # 20. Give business a constructor with self, name, franchises
  def __init__(self, name, franchises):
    self.name = name
    self.items = franchises

# 3. Create first menu: brunch, 11am to 4pm
brunch = Menu(
  "Brunch",
  {'pancakes': 7.50, 'waffles': 9.00, 'burger': 11.00, 'home fries': 4.50, 'coffee': 1.50, 'espresso': 3.00, 'tea': 1.00, 'mimosa': 10.50, 'orange juice': 3.50},
  11,
  16
)

# 4. Create second menu: early_bird, 3pm to 6pm
early_bird = Menu(
  "Early Bird",
  {'salumeria plate': 8.00, 'salad and breadsticks (serves 2, no refills)': 14.00, 'pizza with quattro formaggi': 9.00, 'duck ragu': 17.50, 'mushroom ravioli (vegan)': 13.50, 'coffee': 1.50, 'espresso': 3.00},
  15,
  18
)

# 5. Create third menu: dinner, 5pm to 11pm
dinner = Menu(
  "Dinner",
  {
  'crostini with eggplant caponata': 13.00, 'caesar salad': 16.00, 'pizza with quattro formaggi': 11.00, 'duck ragu': 19.50, 'mushroom ravioli (vegan)': 13.50, 'coffee': 2.00, 'espresso': 3.00,
  },
  17,
  23
)

# 6. Create fourth menu: kids, 11am to 9pm
kids = Menu(
  "Kids",
  {
  'chicken nuggets': 6.50, 'fusilli with wild mushrooms': 12.00, 'apple juice': 3.00
  },
  11,
  21
)

# 8. Test out the string representation
print(brunch)

# 10. Test out calculate_bill() method with a breakfast order of 1 x pancakes, 1 x home fries and 1 x coffee
print(brunch.calculate_bill(['pancakes', 'home fries', 'coffee']))

# 11. Calculate the bill for an early bird puchase of 1 x salumeria plate and 1 x vegan mushroom ravioli
print(early_bird.calculate_bill(['salumeria plate', 'mushroom ravioli (vegan)']))

# 14. Create two franchise stores
flagship_store = Franchise("1232 West End Road", [brunch, early_bird, dinner, kids])

new_installment = Franchise("12 East Mulberry Street", [brunch, early_bird, dinner, kids])

# 17. Test out available_menus() method with 12pm
print(flagship_store.available_menus(12))

# 18. Test out available_menus() method with 5pm
print(flagship_store.available_menus(17))

# 21. Create a business
business_1 = Business("Basta Fazoolin' with my Heart", [flagship_store, new_installment])

# 22. Create a menu: arepas, 10am to 8pm
arepas_menu = Menu(
  "Take A' Arepa",
  {
  'arepa pabellon': 7.00, 'pernil arepa': 8.50, 'guayanes arepa': 8.00, 'jamon arepa': 7.50
  },
  10,
  20
)

# 23. Create a franchise: arepas_place
arepas_place = Franchise("189 Fitzgerald Avenue", [arepas_menu])
arepas = Business("Take a' Arepa", [arepas_place])
print(arepas_place.available_menus(17))