# Write a method that takes in a string and returns the number of
# letters that appear more than once in the string. You may assume
# the string contains only lowercase letters. Count the number of
# letters that repeat, not the number of times they repeat in the
# string.
#
# Difficulty: hard.
import unittest


def num_repeats(string):
    repeats = 0

    letters = {}

    for letter in list(string):
        if letter in letters:
            letters[letter] += 1
        else:
            letters[letter] = 1

    for counts in letters.values():
        if counts > 1:
            repeats += 1

    return repeats


# These are tests to check that your code is working. After writing
# your solution, they should all run.


class NumRepeats(unittest.TestCase):

    def test_simple_case(self):
        self.assertEqual(num_repeats("abdbc"), 1)

    def test_only_one(self):
        self.assertEqual(num_repeats("aaa"), 1)

    def test_double_double(self):
        self.assertEqual(num_repeats("abab"), 2)

    def test_another_double(self):
        self.assertEqual(num_repeats("cadac"), 2)

    def test_no_repeats(self):
        self.assertEqual(num_repeats("abcde"), 0)


if __name__ == '__main__':
    unittest.main()