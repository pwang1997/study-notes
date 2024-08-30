```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    TreeNode ancestor = null;

    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        if (p == null || q == null) return root;
        lca(root, p, q);
        return ancestor;
    }

    public boolean lca(TreeNode root, TreeNode p, TreeNode q) {
        if (root == null || ancestor != null)
            return false;

        boolean temp = false; // target found

        if (p == root || q == root)
            temp = true;

        boolean right = lca(root.right, p, q);
        boolean left = lca(root.left, p, q);

        if ((left && right) || (left && temp) || (right && temp)) {
            ancestor = root;
            return false;
        }

        return left || right || temp;
    }

}
```