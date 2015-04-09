# Write a method that takes in a string. Your method should return the
# most common letter in the array, and a count of how many times it
# appears.
#
# Difficulty: medium.
import unittest


def most_common_letter(string):
    letters = {}
    for letter in list(string):
        if letter in letters:
            letters[letter] += 1
        else:
            letters[letter] = 1

    common_count = 0
    common_letter = None

    for letter, letter_count in letters.items():
        if letter_count > common_count:
            common_count = letter_count
            common_letter = letter

    return [common_letter, common_count]

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class MostCommonLetter(unittest.TestCase):

    def test_three_numbers(self):
        self.assertEqual(most_common_letter('abca'), ['a', 2])

    def test_four_numbers(self):
        self.assertEqual(most_common_letter('abbab'), ['b', 3])

if __name__ == '__main__':
    unittest.main()