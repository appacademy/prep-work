def wonky_coins(n)
  return 1 if n == 0

  num_zero_coins = 0
  non_zero_coins = [n]

  until non_zero_coins.empty?
    coin = non_zero_coins.pop

    if (coin / 2) == 0
      num_zero_coins += 1
    else
      non_zero_coins << (coin / 2)
    end

    if (coin / 3) == 0
      num_zero_coins += 1
    else
      non_zero_coins << (coin / 3)
    end

    if (coin / 4) == 0
      num_zero_coins += 1
    else
      non_zero_coins << (coin / 4)
    end
  end

  num_zero_coins
end
