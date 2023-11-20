class TreeNode {
  int treeValue;
  TreeNode? leftChildNode;
  TreeNode? rightChildNode;

  TreeNode(this.treeValue);
}

class BinarySearchTree {
  //declares a variable named node of type Node
  TreeNode? treeRoot;
// insert() method
  void insertValue(int value) {
    TreeNode newTreeNode = TreeNode(value);

    if (treeRoot == null) {
      treeRoot = newTreeNode;
    } else {
      TreeNode currentValue = treeRoot as TreeNode;
      while (true) {
        if (value < currentValue.treeValue) {
          if (currentValue.leftChildNode == null) {
            currentValue.leftChildNode = newTreeNode;
            break;
          }
          currentValue = currentValue.leftChildNode as TreeNode;
        } else {
          if (currentValue.rightChildNode == null) {
            currentValue.rightChildNode = newTreeNode;
            break;
          }
          currentValue = currentValue.rightChildNode as TreeNode;
        }
      }
    }
  }
}
