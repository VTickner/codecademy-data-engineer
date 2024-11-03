# PROJECT: SCRABBLE

letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
points = [1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 4, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10]

letters_to_points = {key.upper():value for key, value in zip(letters, points)}
letters_to_points[" "] = 0

# print(letters_to_points)

player_to_words = {}
player_to_points = {}

def play_word(player, word):
  word = word.upper()
  player = player.title()
  if player in player_to_words:
    player_to_words[player].append(word)
  else:
    player_to_words[player] = [word]
  update_point_totals(player, word)

def update_point_totals(player, word):
  points = score_word(word)
  if player in player_to_points:
    player_to_points[player] += points
  else:
    player_to_points[player] = points

def score_word(word):
  point_total = 0
  for letter in word:
    point_total += letters_to_points.get(letter, 0)
  return point_total

def play_round():
  player = input("Enter player's name: ")
  word = input(f"Enter {player}'s word to calculate their points score: ")
  play_word(player, word)
  another_round()

def another_round():
  another_word = input("Do you wish to enter another player's word? (Y/N): ")
  if (another_word.upper() == "Y" or another_word.upper() == "YES"):
    play_round()
  else:
    show_results() # show final results if no more data to be entered

def show_results():
    print("The final scores of this scrabble game are:")
    for player, points in player_to_points.items():
      print(f"{player} has scored a total of {points} points.")

play_round()