class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {
    int capacity
    ArrayList<Integer> ints
    CircularBuffer(int capacity) {
        this.capacity = capacity
        this.ints = [] as ArrayList
    }

    void clear() {
        ints = []
    }

    int read() {
        if (ints.size() == 0) throw new EmptyBufferException()
        return ints.remove(0)
    }

    void write(int item) {
        if (ints.size() == capacity) throw new FullBufferException()
        ints += item
    }

    void overwrite(int item) {
        if (ints.size() == capacity) ints.remove(0)
        ints += item
    }
}
