module FoodChain (song) where

import Control.Monad (join)
import Data.Char (toLower)
import Data.List (intersperse)

data Animal = Fly | Spider | Bird | Cat | Dog | Goat | Cow | Horse
    deriving (Eq, Show, Enum, Bounded)

song :: String
song = unlines $ join $ intersperse [""] $ verse <$> ([minBound..maxBound] :: [Animal])

verse :: Animal -> [String]
verse animal = part animal:comment animal:preys animal

name :: Animal -> String
name = fmap toLower . show

part :: Animal -> String
part animal = "I know an old lady who swallowed a " ++ name animal ++ "."

comment :: Animal -> String
comment Fly = "I don't know why she swallowed the fly. Perhaps she'll die."
comment Spider = "It wriggled and jiggled and tickled inside her."
comment Bird = "How absurd to swallow a bird!"
comment Cat = "Imagine that, to swallow a cat!"
comment Dog = "What a hog, to swallow a dog!"
comment Goat = "Just opened her throat and swallowed a goat!"
comment Cow = "I don't know how she swallowed a cow!"
comment Horse = "She's dead, of course!"

end :: Animal -> String
end Fly = ".\nI don't know why she swallowed the fly. Perhaps she'll die."
end Spider = " that wriggled and jiggled and tickled inside her."
end _ = "."

preys :: Animal -> [String]
preys animal =
    if animal == minBound || animal == maxBound
    then []
    else let p = pred animal
          in ["She swallowed the " ++ name animal ++ " to catch the " ++ name p ++ end p] ++ preys p