# Sum Root to Leaf Numbers
Topic: DFS
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
class Solution {
    class Pair {
        TreeNode node;
        int val;

        Pair(TreeNode node, int val) {
            this.node = node;
            this.val = val;
        }
    }

    public int sumNumbers(TreeNode root) {
        if (root.right == null && root.left == null) return root.val;

        int sum = 0;

        Stack<Pair> stack = new Stack<>();
        stack.push(new Pair(root, root.val));
        while (!stack.isEmpty()) {
            Pair p = stack.pop();

            if (p.node.left == null && p.node.right == null) {
                sum += p.val;
            } else {
                int nextVal = p.val * 10;
                if (p.node.left != null) {
                    stack.push(new Pair(p.node.left, nextVal + p.node.left.val));
                }
                if (p.node.right != null) {
                    stack.push(new Pair(p.node.right, nextVal + p.node.right.val));
                }
            }
        }

        return sum;
    }
}
```