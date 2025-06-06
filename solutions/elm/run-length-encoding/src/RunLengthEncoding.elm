module RunLengthEncoding exposing (decode, encode)
import Char exposing (isDigit)

takeWhile : (a -> Bool) -> (List a) -> (List a)
takeWhile predicate list =
  case list of
    []       -> []
    hd::tl   -> if (predicate hd)
                then hd :: takeWhile predicate tl
                else []

encode : String -> String
encode s = encode_ (String.toList s)

encode_ : List Char -> String
encode_ s = case s of
    [] -> ""
    (x::xs) -> let ns = takeWhile (\y -> y == x) xs
                   prefix = case ns of
                                [] -> ""
                                _ -> String.fromInt (1 + List.length ns)
                in prefix ++ String.fromChar x ++ encode_ (List.drop (List.length ns) xs)

decode : String -> String
decode s = decode_ (String.toList s)

decode_ : List Char -> String
decode_ s = case takeWhile isDigit s of
    [] ->
        if s == []
        then ""
        else String.fromList (List.take 1 s) ++ decode_ (List.drop 1 s)
    n ->
        let rest = List.drop (List.length n) s
            c = String.fromList (List.take 1 rest)
            times = Maybe.withDefault 1 (String.toInt (String.fromList n))
        in String.repeat times c ++ decode_ (List.drop 1 rest)