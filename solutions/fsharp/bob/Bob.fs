module Bob

open System.Text.RegularExpressions

let (|IsRegex|_|) pattern input =
    let m = Regex.Match(input, pattern)
    if m.Success then Some()
    else None

let response = function
| IsRegex @"\A(?=.*[A-Z])[^a-z]*\?\Z" -> "Calm down, I know what I'm doing!"
| IsRegex @"\A(?=.*[A-Z])[^a-z]*\Z"   -> "Whoa, chill out!"
| IsRegex @"\?\s*\Z"                  -> "Sure."
| IsRegex @"\A\s*\Z"                  -> "Fine. Be that way!"
| _                                     -> "Whatever."