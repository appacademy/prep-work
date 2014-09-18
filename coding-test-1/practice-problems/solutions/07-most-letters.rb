# Write a method that takes a string in and returns true if the letter
# "z" appears within three letters **after** an "a". You may assume
# that the string contains only lowercase letters.
#
# Difficulty: medium.

def nearby_az(string)
  idx1 = 0
  while idx1 < string.length
    if string[idx1] != "a"
      idx1 += 1
      next
    end

    idx2 = idx1 + 1
    while (idx2 < string.length) && (idx2 <= idx1 + 3)
      if string[idx2] == "z"
        return true
      end

      idx2 += 1
    end

    idx1 += 1
  end

  return false
end

puts("nearby_az(\"baz\") == true: #{nearby_az("baz") == true}")
puts("nearby_az(\"abz\") == true: #{nearby_az("abz") == true}")
puts("nearby_az(\"abcz\") == true: #{nearby_az("abcz") == true}")
puts("nearby_az(\"a\") == false: #{nearby_az("a") == false}")
puts("nearby_az(\"z\") == false: #{nearby_az("z") == false}")
puts("nearby_az(\"za\") == false: #{nearby_az("za") == false}")
