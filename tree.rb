require_relative 'node'
require 'pry-byebug'

class Tree
  include Comparable
  def initialize(arr = [])
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    middle = arr.length / 2
    root = Node.new(arr[middle])
    left = arr[0...middle]
    right = arr[middle + 1..-1]
    root.left = build_tree(left) unless left.empty?
    root.right = build_tree(right) unless right.empty?
    root
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    elsif value > node.data
      node.right = insert(value, node.right)
    end
    node
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      node.data = min_value(node.right)
      node.right = delete(node.data, node.right)
    end
    node
  end

  def min_value(node)
    return node.data if node.left.nil?

    minValue(node.left)
  end

  def find(value, node = @root)
    return node if node.nil? || node.data == value

    return find(value, node.left) if value < node.data

    find(value, node.right)
  end

  def level_order(values = [], queue = [@root])
    until queue.empty?
      value = queue.shift
      values << value.data
      queue << value.left unless value.left.nil?
      queue << value.right unless value.right.nil?
    end
    values
  end

  def inorder

  end
end

data1 = [1, 4, 6, 8]
data2 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
data3 = [1, 2, 3, 4, 5, 6, 7]
tree = Tree.new(data2)
# p tree.find(6345)
# tree.insert(6)
# p tree.find(6)
# tree.delete(7)
# p tree.find(7)

tree3 = Tree.new(data3)
p tree3.level_order
