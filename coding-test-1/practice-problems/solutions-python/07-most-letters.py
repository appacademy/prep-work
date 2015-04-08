# Write a method that takes a string in and returns true if the letter
# "z" appears within three letters **after** an "a". You may assume
# that the string contains only lowercase letters.
#
# Difficulty: medium.
import unittest


def nearby_az(string):
    string = list(string)

    if "a" not in string:
        return False

    else:
        az_found = False
        for index, letter in enumerate(string):
            if letter == "a" and "z" in string[index:index+4]:
                az_found = True
        return az_found

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class MostLetters(unittest.TestCase):

    def test_baz(self):
        self.assertTrue(nearby_az("baz"))

    def test_abz(self):
        self.assertTrue(nearby_az("abz"))

    def test_abcz(self):
        self.assertTrue(nearby_az("abcz"))

    def test_single_a(self):
        self.assertFalse(nearby_az("a"))

    def test_single_z(self):
        self.assertFalse(nearby_az("z"))

    def test_za(self):
        self.assertFalse(nearby_az("za"))

if __name__ == '__main__':
    unittest.main()