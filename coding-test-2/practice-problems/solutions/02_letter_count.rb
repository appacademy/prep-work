def letter_count(str)
  counts = Hash.new(0)

  str.split('').each do |x|
    counts[x] += 1 unless x == " "
  end
  puts counts
end
