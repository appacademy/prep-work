# Write a method that will take a string as input, and return a new
# string with the same letters in reverse order.
#
# Don't use String's reverse method; that would be too simple.
#
# Difficulty: easy.
import unittest


def reverse(string):
    reversed_string = ""

    i = 0
    while i < len(string):
        reversed_string = string[i] + reversed_string
        i += 1

    return reversed_string


# or use splicing
# def reverse_v2(string):
#     return string[::-1]

# These are tests to check that your code is working. After writing
# your solution, they should all print true.


class TestReverse(unittest.TestCase):

    def test_simple_case(self):
        self.assertEqual(reverse("abc"), "cba")

    def test_single_letter(self):
        self.assertEqual(reverse("a"), "a")

    def test_no_letters(self):
        self.assertEqual(reverse(""), "")

if __name__ == '__main__':
    unittest.main()