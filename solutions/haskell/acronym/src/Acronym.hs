module Acronym (abbreviate) where

import Data.Char

sep x = isSpace x || x == '-'
ignore x = not (sep x) && (isLower x || not (isLetter x))

abbreviate :: String -> String
abbreviate "" = ""
abbreviate (x:xs) = toUpper x:abbreviate (f xs)
  where f = dropWhile (not . isLetter) . dropWhile sep . dropWhile ignore . dropWhile isUpper