# Write a method that takes a string and returns true if it is a
# palindrome. A palindrome is a string that is the same whether written
# backward or forward. Assume that there are no spaces; only lowercase
# letters will be given.
#
# Difficulty: easy.
import unittest


def palindrome(string):

    i = 0
    while i < len(string):
        if string[i] != string[(len(string) - 1) - i]:
            return False
        i += 1

    return True

# Alternate solution using splicing.
# def palindrome(string):
#     return string[::-1] == string


# These are tests to check that your code is working. After writing
# your solution, they should all print true.


class Palindrome(unittest.TestCase):

    def test_abc(self):
        self.assertFalse(palindrome("abc"))

    def test_is_palindrome(self):
        self.assertTrue(palindrome("abcba"))

    def test_single_letter(self):
        self.assertTrue(palindrome("z"))

if __name__ == '__main__':
    unittest.main()