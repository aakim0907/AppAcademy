class Array
  def my_each(&blk)
    self.length.times do |i|
      blk.call(self[i])
    end
    self
  end

  def my_select(&blk)
    selected = []
    self.my_each do |el|
      selected << el if blk.call(el)
    end
    selected
  end

  def my_reject(&blk)
    rejected = []
    self.my_each do |el|
      rejected << el unless blk.call(el)
    end
    rejected
  end

  def my_any?(&blk)
    self.my_each { |el| return true if blk.call(el) }
    false
  end

  def my_flatten
    flattened = Array.new
    self.my_each do |el|
      if el.is_a?(Array)
        flattened += el.my_flatten
      else
        flattened << el
      end
    end
    flattened
  end

  def my_zip(*args)
    zipped = Array.new
    self.length.times do |i|
      nested_zip = [self[i]]
      args.my_each { |arr| nested_zip << arr[i] }
      zipped << nested_zip
    end
    zipped
  end

  def my_rotate(n = 1)
    rotated = self.dup
    if n > 0
      n.times { rotated << rotated.shift }
    else
      n.abs.times { rotated = [rotated.pop] + rotated }
    end
    rotated
  end

  def my_join(separator = "")
    joined = ""
    self.length.times do |i|
      joined += self[i]
      joined += separator unless i == self.length - 1
    end
    joined
  end

  def my_reverse
    reversed = Array.new
    self.my_each { |el| reversed.unshift(el) }
    reversed
  end
end
