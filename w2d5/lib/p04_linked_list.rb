class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # prev_el = self.prev
    # next_el = self.next
    #
    # prev_el.next = next_el
    # next_el.prev = prev_el

    #  x = nil
    #
    # @prev.next = @next
    # @next.prev = @prev
    # self.next = nil
    # self.prev = nil
  end
end

class LinkedList
  attr_accessor :store
  attr_reader :head, :tail

  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |el| return el.val if el.key == key }
  end

  def include?(key)
    any? { |el| el.key == key }
  end

  def append(key, val)
    new_link = Link.new(key, val)
    last_link = @tail.prev

    last_link.next = new_link
    new_link.prev = last_link
    new_link.next = @tail
    @tail.prev = new_link
  end

  def update(key, val)
    each { |link| link.val = val if link.key == key }
  end

  def remove(key)
    current = nil
    each { |el| current = el if el.key == key }
    current.next.prev = current.prev
    current.prev.next = current.next
    current
  end

  def each
    ele = @head.next
    until ele == @tail
      yield ele
      ele = ele.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
