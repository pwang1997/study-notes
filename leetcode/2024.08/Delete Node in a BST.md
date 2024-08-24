```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 * int val;
 * TreeNode left;
 * TreeNode right;
 * TreeNode() {}
 * TreeNode(int val) { this.val = val; }
 * TreeNode(int val, TreeNode left, TreeNode right) {
 * this.val = val;
 * this.left = left;
 * this.right = right;
 * }
 * }
 */
class Solution {
    TreeNode parent = null;

    // public TreeNode deleteNode(TreeNode root, int key) {
    // if(root == null) return root;
    // TreeNode leftChild = null, rightChild = null;

    // if(root.val == key) {
    // if(root.left == null && root.right == null) return null;
    // else if(root.left == null) return root.right;
    // else if(root.right == null) return root.left;
    // leftChild = root.left;
    // rightChild = root.right;
    // TreeNode newRoot = rightChild;

    // while(rightChild.left != null) rightChild = rightChild.left;
    // rightChild.left = leftChild;
    // return newRoot;
    // }

    // dfs(root, key);
    // if(parent == null) return root;

    // if(parent.left != null && parent.left.val == key) {
    // leftChild = parent.left.left;
    // rightChild = parent.left.right;
    // parent.left = rightChild;

    // while(parent.left != null) parent = parent.left;
    // parent.left = leftChild;
    // } else if(parent.right != null && parent.right.val == key) {
    // leftChild = parent.right.left;
    // rightChild = parent.right.right;
    // parent.right = leftChild;

    // while(parent.right != null) parent = parent.right;
    // parent.right = rightChild;
    // }
    // return root;
    // }

    // void dfs(TreeNode node, int key) {
    // if(node == null) return;

    // if(node.val < key) {
    // parent = node;
    // dfs(node.right, key);
    // } else if(node.val > key) {
    // parent = node;
    // dfs(node.left, key);
    // } else {
    // return;
    // }
    // }

    public TreeNode deleteNode(TreeNode root, int key) {
        if (root == null)
            return root;

        TreeNode parent = null, node = root;

        while (node != null) {
            if (node.val == key)
                break;

            parent = node;
            if (node.val < key) {
                node = node.right;
            } else {
                node = node.left;
            }
        }

        TreeNode leftChild = null, rightChild = null;

        if (root.val == key) {
            if (root.left == null && root.right == null)
                return null;
            else if (root.left == null)
                return root.right;
            else if (root.right == null)
                return root.left;
            leftChild = root.left;
            rightChild = root.right;
            TreeNode newRoot = rightChild;

            while (rightChild.left != null)
                rightChild = rightChild.left;
            rightChild.left = leftChild;
            return newRoot;
        }

        if (parent.left != null && parent.left.val == key) {
            leftChild = parent.left.left;
            rightChild = parent.left.right;
            parent.left = rightChild;

            while (parent.left != null)
                parent = parent.left;
            parent.left = leftChild;
        } else if (parent.right != null && parent.right.val == key) {
            leftChild = parent.right.left;
            rightChild = parent.right.right;
            parent.right = leftChild;

            while (parent.right != null)
                parent = parent.right;
            parent.right = rightChild;
        }
        return root;
    }
}
```