module Spiral
  ( spiral
  ) where

import Prelude

import Data.Foldable (elem)
import Data.List (List(..), index, updateAt, (!!))
import Data.Maybe (fromMaybe)
import Data.Tuple (fst)
import Data.Tuple.Nested ((/\), type (/\))
import Data.Unfoldable (replicate)

type Board = List (List Int)

data Direction = East | South | West | North

type Position = { x :: Int, y :: Int }
type Fill = Position /\ Direction

nextDirection :: Direction -> Direction
nextDirection East = South
nextDirection South = West
nextDirection West = North
nextDirection North = East

nextPosition :: Fill -> Position
nextPosition ({x, y} /\ East) = { x, y: y - 1 }
nextPosition ({x, y} /\ South) =  { x: x - 1, y }
nextPosition ({x, y} /\ West) = { x, y: y + 1 }
nextPosition ({x, y} /\ North) =  { x: x + 1, y }

spiral :: Int -> Board
spiral 0 = Nil
spiral n = fillBoard $ replicate n (replicate n 0)
  where
  max :: Int
  max = n * n

  isValidPos :: Board -> Position -> Boolean
  isValidPos board {x, y} = 0 `elem` (board !! x >>= flip index y)

  nextFill :: Board -> Fill -> Fill
  nextFill board fill@({x, y} /\ dir) =
    let nextPos = nextPosition fill in
    if isValidPos board nextPos
    then (nextPos /\ dir)
    else nextFill board ({x, y} /\ nextDirection dir)

  setCell :: Int -> Position -> Board -> Board
  setCell i {x, y} board = fromMaybe board $ board !! x >>= updateAt y i >>= flip (updateAt x) board

  fillCell :: Int -> Fill -> Board -> Board
  fillCell i fill board =
    let newBoard = setCell i (fst fill) board in
    if i == max
    then newBoard
    else fillCell (i + 1) (nextFill newBoard fill) newBoard

  fillBoard :: Board -> Board
  fillBoard = fillCell 1 ({x: 0, y: 0} /\ East)