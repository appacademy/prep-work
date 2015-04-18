# Write a method that takes an array of numbers in. Your method should
# return the third greatest number in the array. You may assume that
# the array has at least three numbers in it.
#
# Difficulty: medium.
import unittest


def third_greatest(nums):
    first, second, third = None, None, None
    index = 0
    while index < len(nums):
        value = nums[index]

        if not first or value > first:
            third = second
            second = first
            first = value
        elif not second or value > second:
            third = second
            second = value
        elif not third or value > third:
            third = value

        index += 1
    return third

# Alternate Solution
# def third_greatest(nums):
#     return sorted(nums)[-3]

# These are tests to check that your code is working. After writing
# your solution, they should all print true.


class ThirdGreatest(unittest.TestCase):

    def test_three_numbers(self):
        self.assertEqual(third_greatest([5, 3, 7]), 3)

    def test_four_numbers(self):
        self.assertEqual(third_greatest([5, 3, 7, 4]), 4)

    def test_another_four(self):
        self.assertEqual(third_greatest([2, 3, 7, 4]), 3)

if __name__ == '__main__':
    unittest.main()