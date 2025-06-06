class RotationalCipher(val shift: Int) {
    fun encode(text: String): String {
        return text.map { convert(it) }.joinToString("")
    }

    private fun convert(c: Char): Char {
        if (c.code >= 65 && c.code <= 90) return Char(65 + (c.code - 65 + shift) % 26)
        else if (c.code >= 97 && c.code <= 122) return Char(97 + (c.code - 97 + shift) % 26)
        return c
    }
}
