# Write a method that takes a string and returns the number of vowels
# in the string. You may assume that all the letters are lower cased.
# You can treat "y" as a consonant.
#
# Difficulty: easy.
import unittest


def count_vowels(string):
    vowels = "aeiou"
    vowel_count = 0
    for letter in list(string):
        if letter in vowels:
            vowel_count += 1
    return vowel_count


# Check out list comprehensions
# def count_vowels_v2(string):
#     return sum([1 for letter in list(string) if letter in "aeiou"])


# These are tests to check that your code is working. After writing
# your solution, they should all run.

class CountVowels(unittest.TestCase):

    def test_abcd(self):
        self.assertEqual(count_vowels("abcd"), 1)

    def test_word_color(self):
        self.assertEqual(count_vowels("color"), 2)

    def test_fancy_color(self):
        self.assertEqual(count_vowels("colour"), 3)

    def test_jane_doe(self):
        self.assertEqual(count_vowels("cecilia"), 4)

if __name__ == '__main__':
    unittest.main()