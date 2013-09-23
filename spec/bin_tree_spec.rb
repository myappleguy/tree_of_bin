require 'bin_tree.rb'

describe TreeOfBin do

  before(:each) do
    @tree = TreeOfBin.new
  end

  describe 'newly initialized tree' do
    it 'should have nil for root' do
      @tree.root.should == NIL
    end

    it 'should have a node count of 0' do
      @tree.number_of_nodes == 0
    end
  end

  describe '#put_item' do
    it 'should add new node to the root of an empty tree' do
      @tree.put_item(4)
      @tree.root.info.should == 4
    end

    it 'should add another new node of lesser value to the left of the tree root' do
      @tree.put_item(4)
      @tree.put_item(2)
      @tree.root.left.info.should == 2
    end

    it 'should add another new node of higher value to the right of the tree root' do
      @tree.put_item(4)
      @tree.put_item(8)
      @tree.root.right.info.should == 8
    end
  end

  describe '#pull_item' do
    it 'should remove the root node from the tree when selected' do
      @tree.put_item(4)
      @tree.root.should_not == nil
      @tree.put_item(2)
      @tree.root.left.should_not == nil
      @tree.pull_item(4)
      @tree.root.should_not == nil
      @tree.root.left.should == nil
    end

    it 'should remove the root->left node from the tree when selected' do
      @tree.put_item(4)
      @tree.root.should_not == nil
      @tree.put_item(2)
      @tree.root.left.should_not == nil
      @tree.pull_item(2)
      @tree.root.should_not == nil
      @tree.root.left.should == nil
    end

    it 'should remove the root->right node from the tree when selected' do
      @tree.put_item(4)
      @tree.root.should_not == nil
      @tree.put_item(6)
      @tree.root.right.should_not == nil
      @tree.pull_item(6)
      @tree.root.should_not == nil
      @tree.root.right.should == nil
    end
  end

  describe '#destroy_tree' do
    it 'should remove all nodes from tree' do
      @tree.put_item(4)
      @tree.put_item(2)
      @tree.number_of_nodes.should == 2
      @tree.destroy_tree
      @tree.root.should == nil
    end
  end

  describe '#empty?' do
    it 'should return true if tree is empty' do
      @tree.empty?.should == true
    end

    it 'should return false if tree has a node' do
      @tree.put_item(4)
      @tree.empty?.should == false
    end
  end

  describe '#number_of_nodes' do
    it 'should increment the number of nodes when a node is added' do
      @tree.number_of_nodes.should == 0
      @tree.put_item(4)
      @tree.number_of_nodes.should == 1
    end

    it 'should decrement the number of nodes when a node is removed' do
      @tree.put_item(4)
      @tree.put_item(2)
      @tree.number_of_nodes.should == 2
      @tree.pull_item(2)
      @tree.number_of_nodes.should == 1
    end
  end

  describe '#preorder_traversal' do
    it 'returns if root is nil' do
      @tree.should_receive(:preorder_traversal).once
      @tree.print_nodes
    end

    it 'will print value of root node' do
      Node.stub(:print_info)
      @tree.put_item(4)
      @tree.root.should_receive(:print_info).once
      @tree.print_nodes
    end

    it 'follows left edge first' do
      Node.stub(:print_info)
      @tree.put_item(4)
      @tree.put_item(2)
      @tree.put_item(6)
      @tree.root.should_receive(:left).ordered
      @tree.root.should_receive(:right).ordered
      @tree.print_nodes
    end
  end

  describe '#preorder_traversal_iterative' do
    it 'returns if root is nil' do
      @tree.should_receive(:preorder_traversal_iterative).once
      @tree.print_nodes_iterative
    end

    it 'will print value of root node' do
      Node.stub(:print_info)
      @tree.put_item(4)
      @tree.root.should_receive(:print_info).once
      @tree.print_nodes_iterative
    end

    it 'follows left edge first' do
      Node.stub(:print_info)
      @tree.put_item(4)
      @tree.put_item(2)
      @tree.put_item(6)
      @tree.root.should_receive(:right).ordered
      @tree.root.should_receive(:left).ordered
      @tree.print_nodes_iterative
    end
  end
end

describe Node do

  before(:each) do
    @node = Node.new
  end

  describe 'newly initialized node' do
    describe '#info' do
      it 'should be nil' do
        @node.info.should == nil
      end
    end

    describe '#left' do
      it 'should be nil' do
        @node.left.should == nil
      end
    end

    describe '#right' do
      it 'should be nil' do
        @node.right.should == nil
      end
    end
  end
end








