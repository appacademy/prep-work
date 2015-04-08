# Write a method that takes in a string and an array of indices in the
# string. Produce a new string, which contains letters from the input
# string in the order specified by the indices of the array of indices.
#
# Difficulty: medium.
import unittest


def scramble_string(string, positions):
    scrambled = ""
    for position in positions:
        scrambled += string[position]
    return scrambled

# These are tests to check that your code is working. After writing
# your solution, they should all print true.


class ScrambleString(unittest.TestCase):

    def test_four_letters(self):
        self.assertEqual(scramble_string("abcd", [3, 1, 2, 0]), "dbca")

    def test_six_letters(self):
        self.assertEqual(scramble_string("markov", [5, 3, 1, 4, 2, 0]), "vkaorm")

if __name__ == '__main__':
    unittest.main()