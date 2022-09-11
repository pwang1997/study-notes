## [366. Find Leaves of Binary Tree](https://leetcode.com/problems/find-leaves-of-binary-tree/)

#### Solution

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
    List<List<Integer>> ans;

    public List<List<Integer>> findLeaves(TreeNode root) {
        ans = new ArrayList<>();

        getHeight(root);

        return ans;
    }

    int getHeight(TreeNode node) {
        if (node == null) return -1;

        int leftH = getHeight(node.left);
        int rightH = getHeight(node.right);

        int curH = Math.max(leftH, rightH) + 1;

        if (ans.size() == curH) {
            ans.add(new ArrayList<>());
        }
        ans.get(curH).add(node.val);
        return curH;
    }
}
```