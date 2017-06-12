class MaxIntSet
  attr_reader :max
  attr_accessor :store

  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = num
  end

  def remove(num)
    @store[num] = nil
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def is_valid?(num)
    num < max && num > 0
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    @store[num].delete(num)
  end

  def include?(num)
    @store.any? { |arr| arr.include?(num) }
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count >= num_buckets
    unless self[num].include?(num)
      self[num].push(num)
      @count += 1
    end
  end

  def remove(num)
    @store[num].delete(num)
  end

  def include?(num)
    @store.any? { |arr| arr.include?(num) }
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    size = num_buckets
    size *= 2
    a = ResizingIntSet.new(size)
    dup_store = @store.flatten

    @store = a.store
    @count = 0
    dup_store.each { |el| insert(el) }
  end
end
