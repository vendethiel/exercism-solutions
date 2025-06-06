module TwoBucket exposing (BucketNumber(..), measure)

import Maybe exposing (map)

type BucketNumber
    = One
    | Two


type alias State =
    { moves : Int, bucketOne : Int, bucketTwo : Int }

swap : State -> State
swap s = {moves = s.moves, bucketOne = s.bucketTwo, bucketTwo = s.bucketOne}

measure : Int -> Int -> Int -> BucketNumber -> Maybe State
measure bucketOneSize bucketTwoSize goal startBucket =
    if goal > bucketOneSize && goal > bucketTwoSize
    then Nothing
    else if startBucket == Two
    then map swap (measure bucketTwoSize bucketOneSize goal One)
    else if goal == 0
    then Just {moves = 0, bucketOne = 0, bucketTwo = 0}
    else if goal == bucketOneSize
    then Just {moves = 1, bucketOne = goal, bucketTwo = 0}
    else if goal == bucketTwoSize
    then Just {moves = 2, bucketOne = bucketOneSize, bucketTwo = goal}
    else
        let go steps start1 start2 =
                if start1 /= 0 || start2 /= bucketTwoSize
                then
                    let
                        (v1, v2) =
                            case start1 of
                                0 -> (bucketOneSize, start2)
                                _ -> (start1, 0)
                    in if v1 + v2 <= bucketTwoSize
                    then
                        if v2 == goal
                        then Just {moves = steps - 2, bucketOne = 0, bucketTwo = goal} -- pour 1 into 2
                        else go (steps + 2) 0 (v1 + v2)
                    else if v1 - (bucketTwoSize - v2) == goal
                    then Just {moves = steps, bucketOne = goal, bucketTwo = bucketTwoSize}
                    else go (steps + 2) (v1 - (bucketTwoSize - v2)) bucketTwoSize
                else Nothing
    in go 2 0 0