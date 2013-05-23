
class TreeOfBin
  TreeNode = Struct.new(:info, :left, :right)
	@@number_of_nodes = 0
	attr_accessor :root

  def initialize
    @root = NIL 
	end

	def put_item(info)
		insert(@root, info)
	end

	def insert(tree, info) 
		if tree === NIL
      tree = TreeNode.new(info, NIL, NIL)   
			@@number_of_nodes += 1
		else
     tree.info < info ? insert(tree.left, info) : insert(tree.right, info)
		end
	end

  def call
		"from call"
	end
  
	def number_of_nodes
		@@number_of_nodes
	end
	
end


