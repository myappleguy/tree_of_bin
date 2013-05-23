require "bin_tree.rb"

describe TreeOfBin do

	before(:each) do
    @tree = TreeOfBin.new  
	end

	describe "newly initialized tree" do
		it "should have nil for root" do
			@tree.root.should == NIL 
		end

		it "should have a node count of 0" do
			@tree.number_of_nodes == 0
		end
	end
	
	describe "#call" do
	  it "should say from call from the call method" do
		  @tree.call.should == "from call"
	  end
  end

	describe "#put_item" do
    it "should add new node to the root of an empty tree" do
      @tree.put_item(4)
			@tree.root.info.should == 4
		end

		it "should increment the number of nodes when a node is added" do
			@tree.number_of_nodes.should == 1
		end

		it "should add another new node of lesser value to the left of the tree root" do
			@tree.put_item(2)
			@tree.root.left.info.should == 2
		end
	end
end
