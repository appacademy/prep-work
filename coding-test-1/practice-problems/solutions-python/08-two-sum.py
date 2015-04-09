# Write a method that takes an array of numbers. If a pair of numbers
# in the array sums to zero, return the positions of those two numbers.
# If no pair of numbers sums to zero, return `None`.
#
# Difficulty: medium.
import unittest


def two_sum(nums):
    index1 = 0
    while index1 <= len(nums)-1:
        index2 = index1 + 1
        while index2 <= len(nums)-1:
            if nums[index1] + nums[index2] == 0:
                return [index1, index2]
            index2 += 1
        index1 += 1
    return None

# These are tests to check that your code is working. After writing
# your solution, they should all print true.


class TwoSum(unittest.TestCase):

    def test_has_sum(self):
        self.assertEqual(two_sum([1, 3, 5, -3]), [1, 3])

    def test_is_none(self):
        self.assertIsNone(two_sum([1, 3, 5]))

if __name__ == '__main__':
    unittest.main()