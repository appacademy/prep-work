def no_repeats(year_start, year_end)
  no_repeats = []
  (year_start..year_end).each do |yr|
    no_repeats << yr if no_repeat?(yr)
  end

  no_repeats
end

def no_repeat?(year)
  chars_seen = []
  year.to_s.each_char do |char|
    return false if chars_seen.include?(char)
    chars_seen << char
  end

  return true
end
