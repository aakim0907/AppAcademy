### RANGE
def range(start, finish)
  return [] if finish <= start
  range(start, finish - 1) << finish - 1
  # [start] + range(start + 1, finish)
end

### SUM_ARRAY
def sum_array_iterative(arr)
  sum = 0
  arr.each { |num| sum += num }
  sum
end

def sum_array_recursive(arr)
  return 0 if arr.empty?
  arr.pop + sum_array(arr)
end

### EXPONENTIATION
def expo_one(num, n)
  n.zero? ? 1 : num * expo_one(num, n - 1)
end

# solution2
def expo_two(num, n)
  return 1 if n.zero?
  if n.even?
    expo_two(num, n / 2)**2
  else
    num * (expo_two(num, (n - 1) / 2)**2)
  end
end

### DEEP_DUP
def dup_one(array)
  array_copy = []
  array.each { |el| array_copy << (el.is_a?(Array) ? dup(el) : el) }
  array_copy
end

def dup_two(array)
  array.map { |el| el.is_a?(Array) ? dup(el) : el }
end

def dup_three(array)
  array.inject([]) { |dup, el| dup << (el.is_a?(Array) ? dup(el) : el) }
end

### FIBONACCI
def fibonacci(n)
  fibs = [0, 1]
  return fibs.take(n) if n <= 2
  prev = fibonacci(n - 1)
  prev << prev[-2] + prev[-1]
end

### ARRAY SUBSETS
def subsets(arr)
  return [[]] if arr.empty?
  # return [[], arr] if arr.length == 1
  prev_sub = subsets(arr[0...-1])
  prev_sub.concat(prev_sub.map { |el| el + [arr.last] })
end

### PERMUTATIONS
def permutation_one(array)
  return [array] if array.length == 1
  permutated = []
  permutation(array[0...-1]).map do |arr|
    (0..arr.length).to_a.each do |i|
      nested = dup(arr)
      nested.insert(i, array.last)
      permutated << nested
    end
  end
  permutated
end

def permutation_two(array)
  return [array] if array.length <= 1
  first = array.shift

end

### BINARY SEARCH
def bsearch(array, target)
  middle_index = array.length / 2
  middle_value = array[middle_index]
  return middle_index if middle_value == target
  return nil if array.empty?
  if middle_value < target
    search_results = bsearch(array[middle_index + 1..-1], target)
    search_results ? search_results + middle_index + 1 : search_results
  else 
    bsearch(array[0...middle_index], target)
  end
end

### MERGE SORT
def merge_sort(arr)
  mid_idx = arr.length / 2
  return arr if arr.length <= 1
  left = merge_sort(arr[0...mid_idx])
  right = merge_sort(arr[mid_idx..-1])
  merge(left, right)
end

def merge(arr1, arr2)
  merged = []
  until arr1.empty? || arr2.empty?
    if arr1.first > arr2.first
      merged << arr2.shift
    else
      merged << arr1.shift
    end
  end
  merged + arr1 + arr2
end
