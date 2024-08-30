```java
class Solution {
    public List<List<String>> suggestedProducts(String[] products, String searchWord) {
        List<List<String>> suggestions = new ArrayList<>();

        TreeMap<String, Integer> map = new TreeMap<>();
        Arrays.sort(products);
        List<String> productsList = Arrays.asList(products);

        for (int i = 0; i < products.length; i++) {
            map.put(products[i], i);
        }

        StringBuffer sb = new StringBuffer();
        for (char ch : searchWord.toCharArray()) {
            sb.append(ch);
            String key = sb.toString();
            String ceiling = map.ceilingKey(key);
            String floor = map.floorKey(key + "~"); // upper bound
            if (ceiling == null || floor == null) {
                break;
            }
            suggestions.add(productsList.subList(map.get(ceiling), Math.min(map.get(ceiling) + 3, map.get(floor) + 1)));
        }
        while (suggestions.size() < searchWord.length()) {
            suggestions.add(List.of());
        }
        return suggestions;
    }
}
```