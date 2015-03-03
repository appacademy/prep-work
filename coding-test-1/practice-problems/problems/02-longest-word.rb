# Write a method that takes in a string. Return the longest word in
# the string. You may assume that the string contains only letters and
# spaces. If there are multiple longest words, return the first one
# that appears in the sentence.
#
# You may use the String `split` method to aid you in your quest.
#
# Difficulty: easy.

def longest_word(sentence)
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'longest_word("short longest") == "longest": ' +
  (longest_word('short longest') == 'longest').to_s
)
puts(
  'longest_word("one") == "one": ' +
  (longest_word('one') == 'one').to_s
)
puts(
  'longest_word("abc def abcde") == "abcde": ' +
  (longest_word('abc def abcde') == 'abcde').to_s
)
puts(
'longest_word("aa one two bb ten") == "one": ' +
(longest_word('aa one two bb ten') == 'one').to_s
)
