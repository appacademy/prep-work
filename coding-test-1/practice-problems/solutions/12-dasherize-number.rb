# Write a method that takes in a number and returns a string, placing
# a single dash before/after each odd digit.
#
# Difficulty: medium.

def dasherize_number(num)
  num_s = num.to_s

  result = ""

  idx = 0
  while idx < num_s.length
    digit = num_s[idx].to_i

    if (idx > 0)
      prev_digit = num_s[idx - 1].to_i
      if (prev_digit % 2 == 1) || (digit % 2 == 1)
        result += "-"
      end
    end
    result += num_s[idx]

    idx += 1
  end

  return result
end

puts("dasherize_number(203) == \"20-3\": #{dasherize_number(203) == "20-3"}")
puts("dasherize_number(303) == \"3-0-3\": #{dasherize_number(303) == "3-0-3"}")
puts("dasherize_number(333) == \"3-3-3\": #{dasherize_number(333) == "3-3-3"}")
puts("dasherize_number(3223) == \"3-22-3\": #{dasherize_number(3223) == "3-22-3"}")
