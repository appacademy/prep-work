def wonky_coins(n)
  return 1 if n == 0
  return 3 if n == 1

  # call wonky_coins from inside itself. This is called *recursion*.
  return wonky_coins(n / 2) + wonky_coins(n / 3) + wonky_coins(n / 4)
end
