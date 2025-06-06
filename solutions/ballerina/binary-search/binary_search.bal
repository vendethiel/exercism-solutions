# Search an array for a value and return the index.
#
# + array - a sorted array of integers
# + value - the integer item to find
# + return - the index of the value, or nil if the value is not found
public function find(int[] array, int value) returns int? {
    int[] xs = array.sort();
    return go(xs, value);
}

function go(int[] array, int value) returns int? {
    if (array.length() < 3) {
        return array.indexOf(value);
    }
    int mid = array.length() / 2;
    int midn = array[mid];
    if (value == midn) {
        return mid;
    } else if (value > midn) {
        return mid + go(array.slice(mid), value);
    } else {
        return go(array.slice(0, mid), value);
    }
}