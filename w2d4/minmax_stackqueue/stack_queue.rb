require_relative "my_stack"

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def enqueue(val) #O(1)
    @in_stack.push(val)
  end

  def dequeue
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
    @out_stack.pop
  end
end
