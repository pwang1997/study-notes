# Sum of Prefix Scores of Strings
Topic: Trie
```java
class Solution {
    class TrieNode {
        TrieNode[] children = new TrieNode[26];
        int prefixSum = 0;
    }

    class Trie {
        TrieNode root = new TrieNode();

        void insert(String word) {
            TrieNode node = root;
            for (char ch : word.toCharArray()) {
                if (node.children[ch - 'a'] == null) {
                    node.children[ch - 'a'] = new TrieNode();
                }
                node.children[ch - 'a'].prefixSum++;
                node = node.children[ch - 'a'];
            }
        }

        int calPrefixSum(String word) {
            TrieNode node = root;
            int sum = 0;
            for (char ch : word.toCharArray()) {
                if (node.children[ch - 'a'] == null) {
                    return sum;
                }
                sum += node.children[ch - 'a'].prefixSum;
                node = node.children[ch - 'a'];
            }

            return sum;
        }

    }

    public int[] sumPrefixScores(String[] words) {
        int n = words.length;
        int[] ans = new int[n];

        Trie trie = new Trie();
        for (String word : words) {
            trie.insert(word);
        }

        for (int i = 0; i < n; i++) {
            ans[i] = trie.calPrefixSum(words[i]);
        }
        return ans;
    }
}
```