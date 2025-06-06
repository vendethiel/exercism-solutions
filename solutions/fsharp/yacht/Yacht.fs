module Yacht

let (|ForAll|_|) = function
| x::xs when Seq.forall (fun e -> e = x) xs -> Some x
| _ -> None

type Category = 
| Ones
| Twos
| Threes
| Fours
| Fives
| Sixes
| FullHouse
| FourOfAKind
| LittleStraight
| BigStraight
| Choice
| Yacht

type Die =
| One 
| Two 
| Three
| Four 
| Five 
| Six

let dieToNum = function
| One -> 1 
| Two -> 2
| Three -> 3
| Four -> 4
| Five -> 5
| Six -> 6

let countTimes n dice = Seq.sum [for die in dice do if die = n then yield dieToNum n]

let fullHouse = function
| ForAll _ -> 0
| ([x1; x2; x3; y1; y2] | [y1; y2; x1; x2; x3]) as dice
    when x1 = x2 && x2 = x3 && y1 = y2 -> Seq.sum (List.map dieToNum dice)
| _ -> 0

let foak = function
| ([x1; x2; x3; x4; _] | [_; x1; x2; x3; x4])
    when x1 = x2 && x2 = x3 && x3 = x4 -> 4 * dieToNum x1
| _ -> 0

let yacht = function
| ForAll _ -> 50
| _ -> 0

let littleStraight = function
| [One; Two; Three; Four; Five] -> 30
| _ -> 0

let bigStraight = function
| [Two; Three; Four; Five; Six] -> 30
| _ -> 0

let choice dice = Seq.sum (List.map dieToNum dice)

let score category dice_ =
    let dice = Seq.toList (Seq.sort dice_) in
    match category with
    | Ones -> countTimes One dice
    | Twos -> countTimes Two dice
    | Threes -> countTimes Three dice
    | Fours -> countTimes Four dice
    | Fives -> countTimes Five dice
    | Sixes -> countTimes Six dice
    | FullHouse -> fullHouse dice
    | FourOfAKind -> foak dice
    | LittleStraight -> littleStraight dice
    | BigStraight -> bigStraight dice
    | Choice -> choice dice
    | Yacht -> yacht dice