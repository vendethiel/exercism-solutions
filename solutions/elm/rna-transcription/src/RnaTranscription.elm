module RnaTranscription exposing (toRNA)

import Result exposing (map)

toRNA : String -> Result String String
toRNA s = toRNA_ (String.toList s)

toRNA_ : List Char -> Result String String
toRNA_ s = case s of
    [] -> Ok ""
    ('G'::xs) -> map (String.append "C") (toRNA_ xs)
    ('C'::xs) -> map (String.append "G") (toRNA_ xs)
    ('T'::xs) -> map (String.append "A") (toRNA_ xs)
    ('A'::xs) -> map (String.append "U") (toRNA_ xs)
    _ -> Err "wrong DNA"