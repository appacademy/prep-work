# Write a method that takes an integer `n` in; it should return
# n*(n-1)*(n-2)*...*2*1. Assume n >= 0.
#
# As a special case, `factorial(0) == 1`.
#
# Difficulty: easy.
import unittest


def factorial(n):

    if n < 0:
        return None

    result = 1
    while n > 0:
        result *= n
        n -= 1

    return result

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class TestFactorial(unittest.TestCase):

    def test_zero_case(self):
        self.assertEqual(factorial(0), 1)

    def test_simple_case(self):
        self.assertEqual(factorial(1), 1)

    def test_simple_case_2(self):
        self.assertEqual(factorial(2), 2)

    def test_simple_case_3(self):
        self.assertEqual(factorial(3), 6)

    def test_simple_case_4(self):
        self.assertEqual(factorial(4), 24)

if __name__ == '__main__':
    unittest.main()