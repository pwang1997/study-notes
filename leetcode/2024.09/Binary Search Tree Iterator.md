# Binary Search Tree Iterator
```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class BSTIterator {
    TreeNode head = null;
    List<Integer> list = new ArrayList<>();
    int idx = 0;

    public BSTIterator(TreeNode root) {
        head = root;

        inorder(head);
    }

    private void inorder(TreeNode node) {
        if (node == null) return;

        inorder(node.left);
        list.add(node.val);
        inorder(node.right);
    }

    public int next() {
        return list.get(idx++);
    }

    public boolean hasNext() {
        return list.size() > idx;
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * BSTIterator obj = new BSTIterator(root);
 * int param_1 = obj.next();
 * boolean param_2 = obj.hasNext();
 */
```