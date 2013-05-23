
class TreeOfBin
  attr_reader :root

  def initialize
    @root = nil 
    Node.number_of_nodes = 0 
    #look into call back from node init to increment this as part of the tree
	end

  def put_item(info)
    return @root = Node.new(info) if @root.nil?
    insert(@root, info)
  end

  def insert(node, info)
    return Node.new(info) if node.nil?
    node.info > info ? node.left = insert(node.left, info) : node.right = insert(node.right, info)
  end

  def pull_item(info)
    return @root = delete(@root) if @root.info == info
    @root = remove_item(@root, info)
  end

  def remove_item(node, info)
    return node = delete(node) if node.info == info
    node.info > info ? remove_item(node.left, info) : remove_item(node.right, info)
  end

  def delete(node)
    return nil if node.left.nil? && node.right.nil?
    return node.left if node.right.nil?
    return node.right
  end

  def find_node(node, info)

  end

	def number_of_nodes
		Node.number_of_nodes
	end
	
end

class Node
  attr_accessor :info, :left, :right  
  @@number_of_nodes = 0

  def initialize(info=nil, left=nil, right=nil)
    @info = info
    @left = left
    @right = right   
    @@number_of_nodes += 1
  end

  def Node.number_of_nodes
    @@number_of_nodes
  end

  def Node.number_of_nodes=(num)
    @@number_of_nodes = num
  end
end
