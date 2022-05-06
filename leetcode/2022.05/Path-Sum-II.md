## [113. Path Sum II](https://leetcode.com/problems/path-sum-ii/submissions/)

---

> Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node 
> values in the path equals targetSum. Each path should be returned as a list of the node values, not node references. 
> A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.

#### Solution

DFS

Time Complexity: O(N)

Space Complexity: O(N)

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
    public List<List<Integer>> pathSum(TreeNode root, int targetSum) {
        List<List<Integer>> result = new ArrayList<>();
        List<Integer> partial = new ArrayList<>();
        
        if(root == null)
            return result;
        
        dfs(root, partial, targetSum, result);
        return result;
    }
    
    private void dfs(TreeNode root, List<Integer> partial, int target, List<List<Integer>> result) {
        if(root == null)
            return;
        
        target -= root.val;
        partial.add(root.val);
        if(root.left == null && root.right == null) {
            if(target == 0)
                result.add(new ArrayList<>(partial));
            
            partial.remove(partial.size()-1);
            return;
        }
        
        dfs(root.left, partial, target, result);
        dfs(root.right, partial, target, result);
        partial.remove(partial.size()-1);
    }
}
```