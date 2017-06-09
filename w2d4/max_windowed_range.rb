def windowed_max_range(arr,size) # O(n)

  current_max_range = 0
  idx = 0

  while idx + size <= arr.length
    window = arr[idx...idx+size]
    var = window.max - window.min
    current_max_range = var if current_max_range < var
    idx += 1
  end
  current_max_range
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
