# Write a method that takes in a string of lowercase letters (no
# uppercase letters, no repeats). Consider the *substrings* of the
# string: consecutive sequences of letters contained inside the string.
# Find the longest such string of letters that is a palindrome.
#
# Note that the entire string may itself be a palindrome.
#
# You may want to use Array's Slice indices,
#
#     "abcd"[1:3] == "bc"
#     "abcd"[1:4] == "bcd"
#     "abcd"[2:3] == "c"
#     "abcd"[2:4] == "cd"
#     "abcd"[2:] == "cd"
#     "abcd"[:3] == "abc"
#
# Difficulty: hard.
import unittest


def palindrome(string):
    i = 0
    while i < len(string):
        if string[i] != string[(len(string) - 1) - i]:
            return False
        i += 1

    return True


def longest_palindrome(string):
    best_palindrome = ""

    for i in range(len(string)):
        for j in range(0, i):
            substring = string[j:i + 1]

            if palindrome(substring) and len(substring) > len(best_palindrome):
                best_palindrome = substring

    return best_palindrome

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class LongestPalindrome(unittest.TestCase):

    def test_short_palindrome(self):
        self.assertEqual(longest_palindrome("abcbd"), "bcb")

    def test_longer_palindrome(self):
        self.assertEqual(longest_palindrome("abba"), "abba")

    def test_another_long(self):
        self.assertEqual(longest_palindrome("abcbdeffe"), "effe")

if __name__ == '__main__':
    unittest.main()