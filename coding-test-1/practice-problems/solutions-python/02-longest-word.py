# Write a method that takes in a string. Return the longest word in
# the string. You may assume that the string contains only letters and
# spaces.
#
# You may use the String `split` method to aid you in your quest.
#
# Difficulty: easy.
import unittest


def longest_word(sentence):
    words = sentence.split()
    current_longest = None

    for word in words:
        if current_longest is None:
            current_longest = word
        elif len(word) > len(current_longest):
            current_longest = word

    return current_longest

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class LongestWord(unittest.TestCase):

    def test_two_words(self):
        self.assertEqual(longest_word("short longest"), "longest")

    def test_one_word(self):
        self.assertEqual(longest_word("one"), "one")

    def test_three_words(self):
        self.assertEqual(longest_word("short longest"), "longest")

if __name__ == '__main__':
    unittest.main()