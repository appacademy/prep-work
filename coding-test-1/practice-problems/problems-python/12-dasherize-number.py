# Write a method that takes in a number and returns a string, placing
# a single dash before and after each odd digit. There is one
# exception: don't start or end the string with a dash.
#
# You may wish to use the `%` modulo operation; you can see if a number
# is even if it has zero remainder when divided by two.
#
# Difficulty: medium.

def dasherize_number(num):
  pass

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

print 'dasherize_number(203) == "20-3": ' + str(dasherize_number(203) == '20-3')
print 'dasherize_number(303) == "3-0-3": ' + str(dasherize_number(303) == '3-0-3')
print 'dasherize_number(333) == "3-3-3": ' + str(dasherize_number(333) == '3-3-3')
print 'dasherize_number(3223) == "3-22-3": ' + str(dasherize_number(3223) == '3-22-3')
