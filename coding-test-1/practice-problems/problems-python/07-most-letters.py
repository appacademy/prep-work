# Write a method that takes a string in and returns true if the letter
# "z" appears within three letters **after** an "a". You may assume
# that the string contains only lowercase letters.
#
# Difficulty: medium.

def nearby_az(string):
  pass

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

print 'nearby_az("baz") == True: ' + str(nearby_az('baz') == True)
print 'nearby_az("abz") == True: ' + str(nearby_az('abz') == True)
print 'nearby_az("abcz") == True: ' + str(nearby_az('abcz') == True)
print 'nearby_az("a") == False: ' + str(nearby_az('a') == False)
print 'nearby_az("z") == False: ' + str(nearby_az('z') == False)
print 'nearby_az("za") == False: ' + str(nearby_az('za') == False)
