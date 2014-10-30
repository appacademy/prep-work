# Write a method that takes in a string and returns the number of
# letters that appear more than once in the string. You may assume
# the string contains only lowercase letters. Count the number of
# letters that repeat, not the number of times they repeat in the
# string.
#
# Difficulty: hard.

def num_repeats(str)
  counts = []

  str_idx = 0
  while str_idx < str.length
    letter = str[str_idx]

    counts_idx = 0
    while counts_idx < counts.length
      if counts[counts_idx][0] == letter
        counts[counts_idx][1] += 1
        break
      end
      counts_idx += 1
    end

    if counts_idx == counts.length
      # didn't find this letter in the counts array; count it for the
      # first time
      counts.push([letter, 1])
    end

    str_idx += 1
  end

  num_repeats = 0
  counts_idx = 0
  while counts_idx < counts.length
    if counts[counts_idx][1] > 1
      num_repeats += 1
    end

    counts_idx += 1
  end

  return num_repeats
end

puts("num_repeats(\"abdbc\") == 1: #{num_repeats("abdbc") == 1}")
# one character is repeated
puts("num_repeats(\"aaa\") == 1: #{num_repeats("aaa") == 1}")
puts("num_repeats(\"abab\") == 2: #{num_repeats("abab") == 2}")
puts("num_repeats(\"cadac\") == 2: #{num_repeats("cadac") == 2}")
puts("num_repeats(\"abcde\") == 0: #{num_repeats("abcde") == 0}")
