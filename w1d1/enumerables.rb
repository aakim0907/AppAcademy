class Array

  def my_each
    self.length.times do |i|
      yield self[i]
    end
    self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |s|
      selected << s if prc.call(s)
    end
    selected
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |r|
      rejected << r if !prc.call(r)
    end
    rejected
  end

  def my_any?(&prc)
    self.my_each do |an|
      return true if prc.call(an)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |al|
      return false if !prc.call(al)
    end
    true
  end

  def my_flatten
    flattened = []
    self.my_each do |f|
      f.is_a?(Integer) ? flattened << f : flattened += f.my_flatten
    end
    flattened
  end

  def my_zip(*args)
    results = []
    self.length.times do |i|
      nested = []
      nested << self[i]
      args.my_each { |arr| nested << arr[i] }
      results << nested
      nested = []
    end
    results
  end

  def my_rotate(n = 1)
    rotated = self.dup
    if n > 0
      n.times do |i|
        first = rotated.shift
        rotated.push(first)
      end
    else
      n.abs.times do |i|
        last = rotated.pop
        rotated.unshift(last)
      end
    end
    rotated
  end

  def my_join(sep = "")
    answer = ""
    (self.length - 1).times do |i|
      answer += self[i]
      answer += sep
    end
    answer += self.last
    answer
  end

  def my_reverse
    reversed = []
    self.length.times do |i|
      reversed << self.pop
    end
    reversed
  end

end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
