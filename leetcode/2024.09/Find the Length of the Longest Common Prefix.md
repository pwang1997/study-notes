# Find the Length of the Longest Common Prefix
Topic: Trie
```java
class Solution {
    class TrieNode {
        TrieNode[] children = new TrieNode[10];
    }

    class Trie {
        TrieNode root = new TrieNode();

        void insert(int num) {
            TrieNode node = root;
            String numStr = Integer.toString(num);
            for (char ch : numStr.toCharArray()) {
                int idx = ch - '0';
                if (node.children[idx] == null) {
                    node.children[idx] = new TrieNode();
                }
                node = node.children[idx];
            }
        }

        int findLongestPrefix(int num) {
            TrieNode node = root;
            String numStr = Integer.toString(num);
            int len = 0;
            for (char ch : numStr.toCharArray()) {
                int idx = ch - '0';
                if (node.children[idx] != null) {
                    len++;
                    node = node.children[idx];
                } else {
                    break;
                }
            }
            return len;
        }
    }

    public int longestCommonPrefix(int[] arr1, int[] arr2) {
        Trie trie = new Trie();
        for (int num : arr1) {
            trie.insert(num);
        }

        int maxLen = 0;
        for (int num : arr2) {
            maxLen = Math.max(maxLen, trie.findLongestPrefix(num));
        }
        return maxLen;
    }
}
```