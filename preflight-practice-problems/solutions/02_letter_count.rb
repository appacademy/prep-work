def letter_count(str)
  counts = {}

  str.each_char do |char|
    next if char == " "
    counts[char] = 0 unless counts.include?(char)
    counts[char] += 1
  end

  counts
end
