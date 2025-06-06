open Base

let rec find' needle = function
| [] -> Error "value not in array"
| [a] when a = needle -> Ok 0
| [a; _] when a = needle -> Ok 0
| xs ->
    let middle = (List.length xs) / 2 in
    let atmid = List.nth_exn xs middle in
    if atmid = needle
    then Ok middle
    else begin
        if needle < atmid
        then find' needle (List.take xs middle)
        else Result.map ~f:((+) (middle + 1)) @@ find' needle (List.drop xs @@ 1 + middle)
    end

let find (xs : int array) (needle : int) : (int, string) Result.t = find' needle (List.sort ~compare @@ List.of_array xs)
