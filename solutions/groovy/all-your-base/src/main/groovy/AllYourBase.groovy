class AllYourBase {
    int inputBase
    ArrayList<Integer> digits
    AllYourBase(inputBase, digits) {
        if (inputBase < 2)
            throw new ArithmeticException()
        this.inputBase = inputBase
        this.digits = digits
    }

    def rebase(outputBase) {
        if (outputBase < 2)
            throw new ArithmeticException()
        return split(parse(inputBase, digits), outputBase)
    }

    static parse(base, digits) {
        return digits.indexed().collect { index, item ->
            if (item >= base || item < 0)
                throw new ArithmeticException()
            item * (base ** (digits.size() - 1 - index))
        }.sum()
    }
    static split(value, base) {
        if (value < 1)
            return [0]

        def digits = []
        while (value > 0) {
            digits << Math.round(value % base)
            value = Math.round(Math.floor(value / base))
        }
        return digits.reverse()
    }
}