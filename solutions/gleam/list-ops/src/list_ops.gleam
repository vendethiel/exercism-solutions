pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  case first {
    [x, ..xs] -> [x, ..append(xs, second)]
    [] -> second
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  case lists {
    [x, ..xs] -> append(x, concat(xs))
    [] -> []
  }
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  case list {
    [x, ..xs] -> case function(x) {
      True -> [x, ..filter(xs, function)]
      False -> filter(xs, function)
    }
    [] -> []
  }
}

pub fn length(list: List(a)) -> Int {
  case list {
    [_, ..xs] -> 1 + length(xs)
    [] -> 0
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  case list {
    [x, ..xs] -> [function(x), ..map(xs, function)]
    [] -> []
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [x, ..xs] -> foldl(xs, function(initial, x), function)
    [] -> initial
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  foldl(reverse(list), initial, function)
}

pub fn reverse(list: List(a)) -> List(a) {
  case list {
    [x, ..xs] -> append(reverse(xs), [x])
    [] -> []
  }
}
