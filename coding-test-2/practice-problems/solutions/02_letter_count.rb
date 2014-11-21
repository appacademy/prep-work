def letter_count(str)
  counts = Hash.new(0)

  str.each_char do |x|
    counts[x] += 1 unless x == " "
  end
  return counts
end
