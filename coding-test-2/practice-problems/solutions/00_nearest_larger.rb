def nearest_larger(arr, idx)
  diff = 1
  loop do
    left = idx - diff
    right = idx + diff

    if (left >= 0) && (arr[left] > arr[idx])
      return left
    elsif (right < arr.length) && (arr[right] > arr[idx])
      return right
    else
      return nil
    end
  end
end
