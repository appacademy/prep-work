def sci_not(num)
  num = num.to_f
  pow = 0
  while (num >= 10)
    num /= 10
    pow += 1
  end

  str = ""
  str << num.round.to_s
  str << "."
  str << ((num * 10).round % 10).to_s
  str << ((num * 100).round % 10).to_s
  str << "E"
  str << pow.to_s

  str
end
