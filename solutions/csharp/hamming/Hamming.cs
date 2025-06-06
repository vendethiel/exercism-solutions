using System;
using System.Linq;

public static class Hamming
{
    public static int Distance(string fst, string snd) {
        if (fst.Length != snd.Length)
            throw new ArgumentException();
        return fst.ToCharArray().Zip(snd.ToCharArray(), (a, b) => a != b).Count(b => b);
    }
}