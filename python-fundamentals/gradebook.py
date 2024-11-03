# PROJECT: GRADEBOOK

last_semester_gradebook = [["politics", 80], ["latin", 96], ["dance", 97], ["architecture", 65]]

# Your code below: 
subjects = ["physics", "calculus", "poetry", "history"]
grades = [98, 97, 85, 88]
gradebook = [["physics", 98], ["calculus", 97], ["poetry", 85], ["history", 88]]

print(gradebook)

gradebook.append(["computer science", 100])
gradebook.append(["visual arts", 93])

# increase visual arts grade by 5 points
gradebook[-1][-1] += 5
print(gradebook) 

# remove poetry grade
gradebook[2].remove(85)
print(gradebook) 

# add poetry pass value
gradebook[2].append("Pass")
print(gradebook)

# combine last_semester_gradebook and gradebook together
full_gradebook = last_semester_gradebook + gradebook
print(full_gradebook)