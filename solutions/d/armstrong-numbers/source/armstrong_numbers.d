module armstrong_numbers;

import std.algorithm : count, sum, map;
import std.conv : to;
import std.math.exponential : pow;

pure bool isArmstrongNumber(immutable int number)
{
    immutable string s = number.to!string;
    // round-trip to string so it doesn't take its value as ASCII
    return s.map!(x => x.to!string.to!int.pow(s.count)).sum == number;
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Zero is an Armstrong number
    assert(isArmstrongNumber(0));

    static if (allTestsEnabled)
    {
        // Single digit numbers are Armstrong numbers
        assert(isArmstrongNumber(5));

        // There are no 2 digit Armstrong numbers
        assert(!isArmstrongNumber(10));

        // Three digit number that is an Armstrong number
        assert(isArmstrongNumber(153));

        // Three digit number that is not an Armstrong number
        assert(!isArmstrongNumber(100));

        // Four digit number that is an Armstrong number
        assert(isArmstrongNumber(9474));

        // Four digit number that is not an Armstrong number
        assert(!isArmstrongNumber(9475));

        // Seven digit number that is an Armstrong number
        assert(isArmstrongNumber(9926315));

        // Seven digit number that is not an Armstrong number
        assert(!isArmstrongNumber(9926314));
    }
}
