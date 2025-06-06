(* STDLIB *)
let (<<) f g x = f(g(x))

let explode s = List.init (String.length s) (String.get s)

(* CODE *)

type cell = EmptyCell | BombCell

type count = CountBomb | Count of int

let parseCell = function
    | '*' -> BombCell
    | _ -> EmptyCell

let printCell = function
    | CountBomb -> '*'
    | Count 0 -> ' '
    | Count n -> String.get (string_of_int n) 0

let countBombs = List.length << (List.filter ((==) BombCell))

let eightNeighbors i j : (int * int) list = [
    i - 1, j - 1;
    i - 1, j;
    i - 1, j + 1;
    i, j - 1;
    i, j + 1;
    i + 1, j - 1;
    i + 1, j;
    i + 1, j + 1;
]

let indexOr default xs (i, j) =
    if i < 0 || j < 0 || i >= (List.length xs)
    then default
    else
        let cols = List.nth xs i
        in if j >= List.length cols
            then default
            else List.nth cols j

let neighborsOf xs i j = List.map (indexOr EmptyCell xs) @@ eightNeighbors i j

let bombOrCount xs i j = function
| BombCell -> CountBomb
| EmptyCell -> Count (countBombs @@ neighborsOf xs i j)

let countTable xs =
    List.mapi (fun i cols ->
        List.mapi (bombOrCount xs i) cols
    ) xs

let parseTable = List.map (List.map parseCell)

let printTable = List.map (String.of_seq << List.to_seq << List.map printCell)

let annotate = printTable << countTable << parseTable << List.map explode