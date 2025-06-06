object RunLengthEncoding {

    fun encode(input: String): String {
        if (input == "") return ""
        val fst = input[0]
        val n = input.takeWhile { it == fst }
        val len = if (n.length > 1) n.length.toString() else ""
        return "${len}${fst}${encode(input.substring(n.length))}"
    }

    fun decode(input: String): String {
        if (input == "") return ""
        val digits = input.takeWhile { it.isDigit() }
        val n = if (digits.length == 0) 1 else Integer.parseInt(digits)
        val str = input.substring(digits.length, digits.length + 1).repeat(n)
        val rest = decode(input.substring(digits.length + 1))
        return "$str$rest"
    }
}
