let sorted = (a) => a |> Js.String.split("") |> Js.Array.sortInPlace |> Js.Array.join;
let cmp = (x, y) => x !== y && sorted(x) === sorted(y);

let anagramOf = (x, y) =>
  cmp(String.lowercase_ascii(x), String.lowercase_ascii(y));

let anagrams = x => List.filter(anagramOf(x));
