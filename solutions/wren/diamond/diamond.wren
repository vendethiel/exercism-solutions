

class Diamond {
  static rows(letter) {
    var lc = letter.bytes[0] - 65
    if (lc < 0 || lc > 26) {
      Fiber.abort("invalid argument")
    }
    var lines = (0..lc).map{ |i|
      var current = String.fromCodePoint(65 + i)
      var s = List.filled(lc * 2 + 1, " ")
      s[lc - i] = current
      s[lc + i] = current
      return s.join("")
    }.toList
    return lines + lines.reduce([], Fn.new {|acc,s|[s] + acc}).skip(1)
  }
}