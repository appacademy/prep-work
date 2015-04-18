# Write a method that takes in an integer `num` and returns the sum of
# all integers between zero and num, up to and including `num`.
#
# Difficulty: easy.
import unittest


def sum_nums(num):
    total = 0
    for i in range(num + 1):
        total += i
    return total

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class SumNums(unittest.TestCase):

    def test_one_sum(self):
        self.assertEqual(sum_nums(1), 1)

    def test_two_sum(self):
        self.assertEqual(sum_nums(2), 3)

    def test_three_sum(self):
        self.assertEqual(sum_nums(3), 6)

    def test_four_sum(self):
        self.assertEqual(sum_nums(4), 10)

    def test_five_sum(self):
        self.assertEqual(sum_nums(5), 15)

if __name__ == '__main__':
    unittest.main()
