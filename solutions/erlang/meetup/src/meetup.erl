-module(meetup).

-export([meetup/4]).

next_day({Year, Month, Day}) -> {Year, Month, Day + 1}.

daynum(monday) -> 1;
daynum(tuesday) -> 2;
daynum(wednesday) -> 3;
daynum(thursday) -> 4;
daynum(friday) -> 5;
daynum(saturday) -> 6;
daynum(sunday) -> 7.

find_weekday(Date, DayOfWeek) ->
  Found = calendar:day_of_the_week(Date),
  DayNum = daynum(DayOfWeek),
  if
    Found == DayNum -> Date;
    true -> find_weekday(next_day(Date), DayOfWeek)
  end.

meetup(Year, Month, DayOfWeek, first) -> find_weekday({Year, Month, 1}, DayOfWeek);
meetup(Year, Month, DayOfWeek, second) -> find_weekday(next_day(meetup(Year, Month, DayOfWeek, first)), DayOfWeek);
meetup(Year, Month, DayOfWeek, third) -> find_weekday(next_day(meetup(Year, Month, DayOfWeek, second)), DayOfWeek);
meetup(Year, Month, DayOfWeek, fourth) -> find_weekday(next_day(meetup(Year, Month, DayOfWeek, third)), DayOfWeek);
meetup(Year, Month, DayOfWeek, teenth) -> find_weekday({Year, Month, 13}, DayOfWeek);
meetup(Year, Month, DayOfWeek, last) ->
  Last = calendar:last_day_of_the_month(Year, Month),
  find_weekday({Year, Month, Last - 6}, DayOfWeek).
