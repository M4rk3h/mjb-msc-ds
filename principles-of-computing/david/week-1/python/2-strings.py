# 2-strings.py
# Exercise 1
code="IS4S761"
count=0
# Test that last 3 characters of IS4S761 is a number 
for char in code:
    if not code.isnumeric(): # False
        count += 1
print("\n", "There are", count, "counts of non numeric values in", code, "\n")