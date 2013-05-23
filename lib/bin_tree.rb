
class TreeOfBin
	@@number_of_nodes = 0
  attr_accessor :root
  def initialize
    @root = nil 
	end

	def put_item(info)
		if @root == nil 
      @root == Node.new(info) 
      @@number_of_nodes += 1
    else
      insert(@root, info)
    end
	end

	def insert(root, info) 
		if root === nil
      root == Node.new(info) 
			@@number_of_nodes += 1
		else
     root.info < info ? insert(root.left, info) : insert(root.right, info)
		end
	end

  def call
		"from call"
	end
  
	def number_of_nodes
		@@number_of_nodes
	end
	
end

class Node
  attr_accessor :info, :left, :right  
  def initialize(info=nil, left=nil, right=nil)
    @info = info
    @left = left
    @right = right
    
  end 
end
