# Write a method that takes in a string and returns the number of
# letters that appear more than once in the string. You may assume
# the string contains only lowercase letters. Count the number of
# letters that repeat, not the number of times they repeat in the
# string.
#
# Difficulty: hard.

def num_repeats(array)
  repeats = 0

  idx1 = 0
  while idx1 < array.length
    is_repeat = false
    idx2 = 0
    while idx2 < array.length
      if array[idx1] != array[idx2]
        idx2 += 1
        next
      elsif idx2 < idx1
        # will have previously counted this repeat
        break
      elsif idx2 > idx1
        is_repeat = true
      end

      idx2 += 1
    end

    if is_repeat
      repeats += 1
    end

    idx1 += 1
  end

  return repeats
end

puts("num_repeats(\"abdbc\") == 1: #{num_repeats("abdbc") == 1}")
# one character is repeated
puts("num_repeats(\"aaa\") == 1: #{num_repeats("aaa") == 1}")
puts("num_repeats(\"abab\") == 2: #{num_repeats("abab") == 2}")
puts("num_repeats(\"cadac\") == 2: #{num_repeats("cadac") == 2}")
puts("num_repeats(\"abcde\") == 0: #{num_repeats("abcde") == 0}")
