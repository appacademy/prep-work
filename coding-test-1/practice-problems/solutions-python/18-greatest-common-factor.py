# Write a method that takes in two numbers. Return the greatest
# integer that evenly divides both numbers. You may wish to use the
# `%` modulo operation.
#
# Difficulty: medium.
import unittest


def greatest_common_factor(number1, number2):

    i = number1 if number1 <= number2 else number2
    while True:
        if (number1 % i == 0) and (number2 % i == 0):
            return i
        i -= 1

# These are tests to check that your code is working. After writing
# your solution, they should all print true.


class GreatestCommonFactor(unittest.TestCase):

    def test_three_factor(self):
        self.assertEqual(greatest_common_factor(3, 9), 3)

    def test_eight_factor(self):
        self.assertEqual(greatest_common_factor(16, 24), 8)

    def test_one_factor(self):
        self.assertEqual(greatest_common_factor(3, 5), 1)

if __name__ == '__main__':
    unittest.main()