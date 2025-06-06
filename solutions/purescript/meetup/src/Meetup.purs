module Meetup
  ( Week(..),
    meetup
  )
  where

import Prelude

import Data.Date (Date, Month, Weekday, Year, canonicalDate, day, lastDayOfMonth, month, weekday, year)
import Data.Enum (toEnum, succ, pred)
import Data.Maybe (Maybe(..))

data Week
  = First
  | Second
  | Third
  | Fourth
  | Last
  | Teenth

next :: Date -> Maybe Date
next canon = canonicalDate (year canon) (month canon) <$> succ (day canon)

prev :: Date -> Maybe Date
prev canon = canonicalDate (year canon) (month canon) <$> pred (day canon)

findDay :: (Date -> Maybe Date) -> Weekday -> Date -> Maybe Date
findDay f wd canon =
  if weekday canon == wd
  then Just canon
  else f canon >>= findDay f wd

findNextDay :: Weekday -> Date -> Maybe Date
findNextDay = findDay next

findPrevDay :: Weekday -> Date -> Maybe Date
findPrevDay = findDay prev

meetup :: Year -> Month -> Week -> Weekday -> Maybe Date
meetup y m k wd = case k of
  First -> canonicalDate y m <$> toEnum 1 >>= findNextDay wd
  Second -> meetup y m First wd >>= next >>= findNextDay wd
  Third -> meetup y m Second wd >>= next >>= findNextDay wd
  Fourth -> meetup y m Third wd >>= next >>= findNextDay wd
  Last -> findPrevDay wd $ canonicalDate y m (lastDayOfMonth y m)
  Teenth -> canonicalDate y m <$> toEnum 13 >>= findNextDay wd