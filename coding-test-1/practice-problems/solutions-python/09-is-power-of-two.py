# Write a method that takes in a number and returns true if it is a
# power of 2. Otherwise, return false.
#
# You may want to use the `%` modulo operation. `5 % 2` returns the
# remainder when dividing 5 by 2; therefore, `5 % 2 == 1`. In the case
# of `6 % 2`, since 2 evenly divides 6 with no remainder, `6 % 2 == 0`.
#
# Difficulty: medium.
import unittest


def is_power_of_two(num):
    if num == 0:
        return False

    while num > 0:
        if num == 1:
            return True
        elif num % 2 == 0:
            num /= 2
        else:
            return False

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class PowerOfTwo(unittest.TestCase):

    def test_check_one(self):
        self.assertTrue(is_power_of_two(1))

    def test_check_16(self):
        self.assertTrue(is_power_of_two(16))

    def test_check_64(self):
        self.assertTrue(is_power_of_two(64))

    def test_check_78(self):
        self.assertFalse(is_power_of_two(78))

    def test_check_0(self):
        self.assertFalse(is_power_of_two(0))

if __name__ == '__main__':
    unittest.main()