import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

class Knapsack {

    int maximumValue(int maximumWeight, List<Item> items) {
        return maximumValue(maximumWeight, new HashSet<>(), items);
    }

    int maximumValue(int maximumWeight, Set<Item> current, List<Item> rem) {
        int weight = current.stream().mapToInt(Item::getWeight).sum();
        if (weight > maximumWeight)
            return 0;

        var currentValue = current.stream().mapToInt(Item::getValue).sum();

        if (rem.isEmpty()) // Nothing more to see
            return currentValue;
        var withSelf = new HashSet<>(current);
        withSelf.add(rem.get(0));
        var tail = tail(rem);

        return Math.max(
            maximumValue(maximumWeight, current, tail),
            Math.max(
                maximumValue(maximumWeight, withSelf, tail),
                currentValue
            )
        );
    }

    // Java is dogshit
    private static List<Item> tail(List<Item> list) {
        return list.subList(1, list.size());
    }
}