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
    # return unless find(value)

    # if value < node.data

    # if node.left.nil? && node.right.nil?
    #   # delete leaf
    # elsif node.left.nil?
    #   node = node.right
    #   node.right = nil
    # elsif node.right.nil?
    #   node = node.left
    #   node.left = nil
    # end
  end

  def find(value, node = @root)
    return node if node.nil? || node.data == value

    return find(value, node.left) if value < node.data

    find(value, node.right)
  end
end

data1 = [1, 4, 6, 8]
data2 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(data1)
p tree.find(6345)
tree.insert(7)
p tree.find(6)
p tree.find(7)
p tree
