class Hamming {
  static compute(first, second) {
    if (first.count != second.count) {
      Fiber.abort("strands must be of equal length")
    }
    return (0...first.count).where {|n| first[n] != second[n]}.count
  }
}
