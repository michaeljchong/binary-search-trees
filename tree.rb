require_relative 'node'

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
    return if find(value)

    if value < node.data
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert(value, node.left)
      end
    elsif value > node.data
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert(value, node.right)
      end
    end
  end

  def delete(value)

  end

  def find(value, node = @root)
    return nil if node.nil?

    if value < node.data
      find(value, node.left)
    elsif value > node.data
      find(value, node.right)
    else
      node
    end
  end
end

data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(data)
p tree.search(6345)
p tree.find(6345)
tree.insert(6)
p tree.find(6)
p tree.find(7)
