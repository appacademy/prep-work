def letter_count(str)
  str_array = str.split('')
  hashorama = Hash.new(0)

  str_array.each do |x|
    hashorama[x] += 1 unless x == " "
  end
  puts hashorama
end
