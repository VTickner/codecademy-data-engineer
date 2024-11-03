# PROJECT: HACKING THE FENDER
# Other files belonging to project: boss_message.json, compromised_users.txt, new_passwords.csv, passwords.csv

import csv, json, os

# create list of all compromised users
compromised_users = []
with open("passwords.csv") as password_file:
  password_csv = csv.DictReader(password_file)
  for row in password_csv:
    password_row = row
    compromised_users.append(password_row["Username"])

# write compromised users to txt file
with open("compromised_users.txt", "w") as compromised_user_file:
  for compromised_user in compromised_users:
    compromised_user_file.write(compromised_user + "\n")

# write json message
with open("boss_message.json", "w") as boss_message_json:
  boss_message_dict = {"recipient": "The Boss", "message": "Mission Success"}
  json.dump(boss_message_dict, boss_message_json)

# create new passwords csv
with open("new_passwords.csv", "w") as new_passwords_obj:
  slash_null_sig = """ _  _     ___   __  ____             
/ )( \   / __) /  \(_  _)            
) \/ (  ( (_ \(  O ) )(              
\____/   \___/ \__/ (__)             
 _  _   __    ___  __ _  ____  ____  
/ )( \ / _\  / __)(  / )(  __)(    \ 
) __ (/    \( (__  )  (  ) _)  ) D ( 
\_)(_/\_/\_/ \___)(__\_)(____)(____/ 
        ____  __     __    ____  _  _ 
 ___   / ___)(  )   / _\  / ___)/ )( \ 
(___)  \___ \/ (_/\/    \ \___ \) __ (
       (____/\____/\_/\_/ (____/\_)(_/
 __ _  _  _  __    __                
(  ( \/ )( \(  )  (  )               
/    /) \/ (/ (_/\/ (_/\             
\_)__)\____/\____/\____/
  """
  new_passwords_obj.write(slash_null_sig)

# rename new_passwords.csv to passwords.csv
# os.rename("new_passwords.csv", "passwords.csv")