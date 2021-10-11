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
      node = queue.shift
      values << node.data
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    values
  end

  def inorder(values = [], node = @root)
    return if node.nil?

    inorder(values, node.left)
    values << node.data
    inorder(values, node.right)
    values
  end

  def preorder(values = [], node = @root)
    return if node.nil?

    values << node.data
    preorder(values, node.left)
    preorder(values, node.right)
    values
  end

  def postorder(values = [], node = @root)
    return if node.nil?

    postorder(values, node.left)
    postorder(values, node.right)
    values << node.data
    values
  end

  def height(node)
    # binding.pry
    return 0 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    left_height >= right_height ? 1 + left_height : 1 + right_height
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

data = [76, 53, 92, 27, 68, 90, 99, 8, 33, 62, 82, 96]
data1 = Array.new(15) { rand(1..100) }
tree = Tree.new(data)
tree.pretty_print
p tree.height(tree.find(53))
p tree.level_order
p tree.inorder
p tree.preorder
p tree.postorder
