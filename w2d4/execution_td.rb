class Array

  def my_min #O(n^2)

    self.each do |x|
      start = x
      self.each do |y|
        start = y if y < x
      end
      return x if x == start
    end
  end

  def my_min2 #O(n)
    min_val = self.first
    (1..self.length-1).each do |idx|
      min_val = self[idx] if self[idx] < min_val
    end
    min_val
  end

  def largest_contiguous_subnum #O(n^2)
    result = []
    (0..(length - 1)).each do |idx|
      cur_el = [self[idx]]
      result << cur_el
      ((idx + 1)..(length - 1)).each do |idx2|
        cur_el << self[idx2]
        result << cur_el
      end
    end
    result.map { |x| x.reduce(:+) }.max
  end

  def largest_contiguous_subnum2 #O(n) / O(1)
    max = first
    (0..length - 1).each do |idx|
      (idx..length - 1).each do |idx2|
        sum = self[idx..idx2].reduce(:+)
        max = sum if sum > max
      end
    end
    max
  end

  def n_subum
    max = self.first
    (1..-1).each do |idx|
      max += self[idx] if self[idx] > 0
      if self[idx] < 0
        if self[idx + 1] > 0
          max < self[idx] ? max = 0 : max += self[idx]
        else
          max < abs(self[idx] + self[idx+1])
          max = self[idx]  
        end
      end
    end
    max
  end

end
