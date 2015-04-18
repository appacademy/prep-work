# Write a method that takes in a string of lowercase letters and
# spaces, producing a new string that capitalizes the first letter of
# each word.
#
# You'll want to use the `split` and `join` methods. Also, the String
# method `upper`, which converts a string to all upper case will be
# helpful.
#
# Difficulty: medium.
import unittest


def capitalize_words(string):
    words = string.split(" ")

    index = 0
    capitalized = []
    while index < len(words):
        word = words[index]
        word = word[0].upper() + word[1:]
        capitalized.append(word)
        index += 1

    return " ".join(capitalized)


# These are tests to check that your code is working. After writing
# your solution, they should all run.


class CapitalizeWords(unittest.TestCase):

    def test_one_dash(self):
        self.assertEqual(capitalize_words("this is a sentence"), "This Is A Sentence")

    def test_two_dashes(self):
        self.assertEqual(capitalize_words("mike bloomfield"), "Mike Bloomfield")

if __name__ == '__main__':
    unittest.main()