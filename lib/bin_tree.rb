
class TreeOfBin
  attr_reader :root, :number_of_nodes

  def initialize
    @root = nil
    @number_of_nodes = 0
  end

  def put_item(info)
    @number_of_nodes += 1
    return @root = Node.new(info) if @root.nil?
    insert(@root, info)
  end

  def insert(node, info)
    return Node.new(info) if node.nil?
    node.info > info ? node.left = insert(node.left, info) : node.right = insert(node.right, info)
  end

  def pull_item(info)
    @number_of_nodes -= 1
    return @root = delete(@root) if @root.info == info
    remove_item(@root, info)
  end

  def remove_item(node, info)
    return delete(node) if node.info == info
    node.info > info ? node.left = remove_item(node.left, info) : node.right = remove_item(node.right, info)
  end

  def delete(node)
    return nil if node.left.nil? && node.right.nil?
    return node.left if node.right.nil?
    return node.right
  end

  def destroy_tree
    @root = nil
    @number_of_nodes = 0
  end

  def empty?
    @root == nil
  end

  def number_of_nodes
    @number_of_nodes
  end

  def print_nodes
    preorder_traversal(@root)
  end

  def print_nodes_iterative
    preorder_traversal_iterative(@root)
  end

  def preorder_traversal(root)
    return unless root
    root.print_info
    preorder_traversal(root.left)
    preorder_traversal(root.right)
  end

  def preorder_traversal_iterative(root)
    stack = [root]
    while !stack.empty?
      current_node = stack.pop
      return nil unless current_node
      current_node.print_info
      stack.push(current_node.right) if current_node.right
      stack.push(current_node.left) if current_node.left
    end
  end
end

class Node
  attr_accessor :info, :left, :right

  def initialize(info=nil, left=nil, right=nil)
    @info = info
    @left = left
    @right = right
  end

  def print_info
    puts @info
  end
end
