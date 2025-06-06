class ListOps {
  static func append<T>(_ a: [T], _ b: [T]) -> [T] {
    var c = a
    c.append(contentsOf: b)
    return c
  }
  static func concat<T>(_ xs: [T]...) -> [T] {
    return foldLeft(xs, accumulated: [], combine: append)
  }
  static func map<A, B>(_ xs: [A], _ fn: (A) -> B) -> [B] {
    return foldLeft(xs, accumulated: [B](), combine: { append($0, [fn($1)]) })
  }
  static func flatMap<A, B>(_ xs: [A], _ fn: (A) -> [B]) -> [B] {
    let mapped: [[B]] = map(xs, fn)
    return foldLeft(mapped, accumulated: [B](), combine: append)
  }
  static func length<A>(_ xs: [A]) -> Int {
    return foldLeft(xs, accumulated: 0, combine: { n, _ in n + 1 })
  }
  static func filter<A>(_ xs: [A], _ fn: (A) -> Bool) -> [A] {
    return flatMap(xs, { fn($0) ? [$0] : [A]() })
  }
  static func foldLeft<A, B>(_ xs: [A], accumulated: B, combine: (B, A) -> B) -> B {
    var acc = accumulated
    for x in xs {
      acc = combine(acc, x)
    }
    return acc
  }
  static func foldRight<A>(_ xs: [A], accumulated: A, combine: (A, A) -> A) -> A {
    var acc = accumulated
    for x in reverse(xs) {
      acc = combine(x, acc)
    }
    return acc
  }
  static func reverse<A>(_ xs: [A]) -> [A] {
    return foldLeft(xs, accumulated: [A](), combine: { append([$1], $0) })
  }
}