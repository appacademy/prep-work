# Write a method that returns the `n`th prime number. Recall that only
# numbers greater than 1 can be prime.
#
# Difficulty: medium.
import unittest


# You may use our `is_prime` solution.
def is_prime(number):
    if number <= 1:
        return False

    index = 2
    while index < number:
        if number % index == 0:
            return False
        index += 1
    return True


def nth_prime(n):
    prime_num = 0

    i = 2
    while True:
        if is_prime(i):
            prime_num += 1
        if prime_num == n:
            return i
        i += 1

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class TestNthPrime(unittest.TestCase):

    def test_first_prime(self):
        self.assertEqual(nth_prime(1), 2)

    def test_second_prime(self):
        self.assertEqual(nth_prime(2), 3)

    def test_third_prime(self):
        self.assertEqual(nth_prime(3), 5)

    def test_fourth_prime(self):
        self.assertEqual(nth_prime(4), 7)

    def test_fifth_prime(self):
        self.assertEqual(nth_prime(5), 11)

if __name__ == '__main__':
    unittest.main()