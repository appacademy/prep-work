# Write a method that takes in a string and returns the number of
# letters that appear more than once in the string. You may assume
# the string contains only lowercase letters. Count the number of
# letters that repeat, not the number of times they repeat in the
# string.
#
# Difficulty: hard.

def num_repeats(string)
	used = []
	accountedFor = []
	res = i = 0
	#iterate over string
	while i < string.length
		#if char hasn't been accounted for ...
		#account for it
		if !accountedFor.include?(string[i])
			accountedFor.push(string[i])
		#else if accounted for has it been used?
		elsif !used.include?(string[i])
			res += 1
			used.push(string[i])
		end
	i += 1
	end
	#return number of duplicate occurances
	return res
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('num_repeats("abdbc") == 1: ' + (num_repeats('abdbc') == 1).to_s)
# one character is repeated
puts('num_repeats("aaa") == 1: ' + (num_repeats('aaa') == 1).to_s)
puts('num_repeats("abab") == 2: ' + (num_repeats('abab') == 2).to_s)
puts('num_repeats("cadac") == 2: ' + (num_repeats('cadac') == 2).to_s)
puts('num_repeats("abcde") == 0: ' + (num_repeats('abcde') == 0).to_s)
