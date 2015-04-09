# Write a method that takes in an integer (greater than one) and
# returns true if it is prime; otherwise return false.
#
# You may want to use the `%` modulo operation. `5 % 2` returns the
# remainder when dividing 5 by 2; therefore, `5 % 2 == 1`. In the case
# of `6 % 2`, since 2 evenly divides 6 with no remainder, `6 % 2 == 0`.
# More generally, if `m` and `n` are integers, `m % n == 0` if and only
# if `n` divides `m` evenly.
#
# You would not be expected to already know about modulo for the
# challenge.
#
# Difficulty: medium.
import unittest


def is_prime(number):
    if number <= 1:
        return False

    index = 2
    while index < number:
        if number % index == 0:
            return False
        index += 1
    return True


# These are tests to check that your code is working. After writing
# your solution, they should all print true.


class IsPrime(unittest.TestCase):

    def test_small_prime(self):
        self.assertTrue(is_prime(2))

    def test_another_small(self):
        self.assertTrue(is_prime(3))

    def test_small_square(self):
        self.assertFalse(is_prime(4))

    def test_another_square(self):
        self.assertFalse(is_prime(9))

if __name__ == '__main__':
    unittest.main()