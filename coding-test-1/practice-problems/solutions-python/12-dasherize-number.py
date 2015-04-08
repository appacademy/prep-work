# Write a method that takes in a number and returns a string, placing
# a single dash before and after each odd digit. There is one
# exception: don't start or end the string with a dash.
#
# You may wish to use the `%` modulo operation; you can see if a number
# is even if it has zero remainder when divided by two.
#
# Difficulty: medium.
import unittest


def dasherize_number(num):
    num_s = str(num)

    result = ""

    idx = 0
    while idx < len(num_s):
        digit = int(num_s[idx])

        if idx > 0:
            prev_digit = int(num_s[idx - 1])
            if (prev_digit % 2 == 1) or (digit % 2 == 1):
                result += "-"

        result += num_s[idx]

        idx += 1

    return result

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class DasherizeNumber(unittest.TestCase):

    def test_one_dash(self):
        self.assertEqual(dasherize_number(203), "20-3")

    def test_two_dashes(self):
        self.assertEqual(dasherize_number(303), "3-0-3")

    def test_triple_threes(self):
        self.assertEqual(dasherize_number(333), "3-3-3")

    def test_double_double(self):
        self.assertEqual(dasherize_number(3223), "3-22-3")

if __name__ == '__main__':
    unittest.main()