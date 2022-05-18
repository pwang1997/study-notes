## [208. Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)

---

> A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a 
> dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
> 
> Implement the Trie class:
> 
> Trie() Initializes the trie object.
> 
> void insert(String word) Inserts the string word into the trie.
> 
> boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
> 
> boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.

#### Solution

```java
class Trie {

    class TrieNode {

        // R links to node children
        private TrieNode[] links;

        private final int R = 26;

        private boolean isEnd;

        public TrieNode() {
            links = new TrieNode[R];
        }

        public boolean containsKey(char ch) {
            return links[ch -'a'] != null;
        }
        public TrieNode get(char ch) {
            return links[ch -'a'];
        }
        public void put(char ch, TrieNode node) {
            links[ch -'a'] = node;
        }
        public void setEnd() {
            isEnd = true;
        }
        public boolean isEnd() {
            return isEnd;
        }
    }
    
    private TrieNode root;
    public Trie() {
        root = new TrieNode();
    }
    
    public void insert(String word) {
        char[] chs = word.toCharArray();
        TrieNode node = root;
        for(char ch : chs) {
            if(!node.containsKey(ch)) {
                node.put(ch, new TrieNode());
            }
            node = node.get(ch);
        }
        node.setEnd();
    }
    
    private TrieNode searchPrefix(String word) {
        TrieNode node = root;
        for(char ch : word.toCharArray()) {
            if(node.containsKey(ch)) {
                node = node.get(ch);
            } else {
                return null;
            }
        }
        return node;
    }
    
    public boolean search(String word) {
        TrieNode node = searchPrefix(word);
        
        return node != null && node.isEnd();
    }
    
    public boolean startsWith(String prefix) {
        return searchPrefix(prefix) != null;
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * Trie obj = new Trie();
 * obj.insert(word);
 * boolean param_2 = obj.search(word);
 * boolean param_3 = obj.startsWith(prefix);
 */
```