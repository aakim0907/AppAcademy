require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count >= num_buckets
    self[key.hash].push(key)
    @count += 1
  end

  def include?(key)
    @store.any? { |arr| arr.include?(key) }
  end

  def remove(key)
    self[key.hash].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    size = num_buckets
    size *= 2
    a = HashSet.new(size)
    dup_store = @store.flatten

    @store = a.store
    @count = 0
    dup_store.each { |el| self.insert(el) }
  end
end
