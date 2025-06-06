class LargestSeriesProduct {
    static largestProduct(digits, span) {
        if (span > digits.size())
            throw new IllegalArgumentException("span must be smaller than string length")
        if (span < 0)
            throw new IllegalArgumentException("span must not be negative")
        if (digits.find(/[^0-9]/))
            throw new IllegalArgumentException("digits input must only contain digits")
        if (span == 0 && digits.isEmpty())
            return 1
        def xs = digits.split('').collect { it.toInteger() }
        return xs
            .dropRight(span - 1)
            .indexed()
            .collect { i, _ ->
                xs.drop(i).take(span).inject(1) {a,b -> a * b}
            }.max()
    }
}
