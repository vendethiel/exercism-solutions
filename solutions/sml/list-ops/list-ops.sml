fun append ([]: int list, ys: int list): int list = ys
  | append ((x::xs): int list, ys: int list): int list = x::append (xs,ys)

fun concat ([]: int list list) = []
  | concat ((x::xs): int list list) = append (x,(concat xs))

fun map (_: int -> int, []: int list): int list = []
  | map (f: int -> int, (x::xs): int list): int list = f x::map (f,xs)

fun foldl (_: int * int -> int, initial: int, []: int list): int = initial
  | foldl (f: int * int -> int, initial: int, (x::xs): int list): int = foldl(f, f (initial, x), xs)

fun reverse ([]: int list): int list = []
  | reverse ((x::xs): int list): int list = append (reverse xs,[x])

fun filter (f: int -> bool, []: int list): int list = []
  | filter (f: int -> bool, (x::xs): int list): int list =
    if f x then x::filter (f,xs) else filter (f, xs)

fun length (list: int list): int =
  foldl ((fn (n, _) => n + 1), 0, list)

fun foldr (_: int * int -> int, initial: int, []: int list): int = initial
  | foldr (f: int * int -> int, initial: int, (x::xs): int list): int = f (x, foldr(f, initial, xs))
