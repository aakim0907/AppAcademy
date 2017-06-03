require 'byebug'
class PolyTreeNode
  attr_reader :value, :children, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) if @parent
    @parent = node
    return nil if node.nil? # and don't add any children
    node.children << self unless node.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "this node is not a child" unless @children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value #base case 1 for recursion
    # exit recursion with return self from line above
    self.children.each do |child|
      child_dfs = child.dfs(target_value)
      # once you exit recursion, next line runs and you exit the method
      return child_dfs if child_dfs
    end
    nil # base case 2 for recursion
  end

  def bfs(target_value)
    arr = []
    arr.push(self)
    until arr.empty?
      node_removed = arr.shift
      if node_removed.value == target_value
        return node_removed
      else
        arr.concat(node_removed.children)
      end
    end

    nil
  end
end
