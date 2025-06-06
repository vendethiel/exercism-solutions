using System;

public static class CollatzConjecture
{
    public static int Steps(int number) => number switch
    {
        _ when number < 1 => throw new ArgumentOutOfRangeException(""),
        1 => 0,
        _ when number % 2 == 0 => 1 + Steps(number / 2),
        _ => 1 + Steps(number * 3 + 1),
    };
    // WTB Active Patterns
}