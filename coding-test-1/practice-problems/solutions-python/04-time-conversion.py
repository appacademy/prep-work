# Write a method that will take in a number of minutes, and returns a
# string that formats the number into `hours:minutes`.
#
# Difficulty: easy.
import unittest


def time_conversion(minutes):
    hours = 0

    while minutes >= 60:
        hours += 1
        minutes -= 60

    return "{}:{}".format(hours, str(minutes).zfill(2))

# These are tests to check that your code is working. After writing
# your solution, they should all run.


class TimeConversion(unittest.TestCase):

    def test_minutes_only(self):
        self.assertEqual(time_conversion(15), "0:15")

    def test_both(self):
        self.assertEqual(time_conversion(150), "2:30")

    def test_hours_only(self):
        self.assertEqual(time_conversion(360), "6:00")

if __name__ == '__main__':
    unittest.main()