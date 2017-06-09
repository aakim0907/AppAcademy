def windowed_max_range(arr, size) # O(2n)
  current_max_range = 0
  idx = 0

  while idx + size <= arr.length
    window = arr[idx...idx + size]
    range = window.max - window.min
    current_max_range = range if current_max_range < range
    idx += 1
  end
  current_max_range
end


def max_windowed_range(arr, size) #O(n)
  queue = MinMaxStackQueue.new
  best_range = nil

  array.each do |el|
    queue.enqueue(el)
    queue.dequeue if queue.size > window_size

    if queue.size == window_size
      current_range = queue.max - queue.min
      best_range = current_range if !best_range || current_range > best_range
    end
  end

  best_range
end
