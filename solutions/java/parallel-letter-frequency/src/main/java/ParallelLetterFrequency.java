import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.stream.Stream;
import java.util.stream.Collectors;
import java.util.concurrent.CompletableFuture;

class ParallelLetterFrequency {
    private String[] texts;
    ParallelLetterFrequency(String[] texts) {
        this.texts = texts;
    }

    Map<Character, Integer> countLetters() {
        return Arrays.stream(texts)
            .map(text -> CompletableFuture.supplyAsync(() -> {
                var submap = new HashMap<Character, Integer>();
                countTo(submap, text);
                return submap;
            }))
            .toList() // force all futures to be created
            .stream()
            .map(CompletableFuture::join)
            .collect(Collectors.reducing(
                new HashMap<Character, Integer>(),
                ParallelLetterFrequency::mergeMap
            ));
    }

    private static void countTo(Map<Character, Integer> map, String text) {
        for (int i = 0; i < text.length(); i++) {
            char c = Character.toLowerCase(text.charAt(i));
            if (!Character.isLetter(c))
                continue;
            map.merge(c, 1, (x, y) -> x + y);
        }
    }

    private static Map<Character, Integer> mergeMap(Map<Character, Integer> result, Map<Character, Integer> merge) {
        for (var entry : merge.entrySet()) {
            result.merge(entry.getKey(), entry.getValue(), (x, y) -> x + y);
        }
        return result;
    }
}
