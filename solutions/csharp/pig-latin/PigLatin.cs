using System;
using System.Text.RegularExpressions;
using System.Linq;

public static class PigLatin
{
    public static string Translate(string sentence) =>
        String.Join(' ', sentence.Split(' ').Select(Convert));

    public static string Convert(string word)
    {
        var basic = Regex.Match(word, @"^[aeiou]|^xr|^yt");
        if (basic.Success)
            return word + "ay";

        var y = Regex.Match(word, @"^([^aiueo]+)(y.*)$");
        if (y.Success)
            return Ay(y);

        var qu = Regex.Match(word, @"^([^aiueo]*qu)(.*)$");
        if (qu.Success)
            return Ay(qu);

        var consonant = Regex.Match(word, @"^([^aiueo]+)(.*)$");
        if (consonant.Success)
            return Ay(consonant);
        
        return word;
    }

    private static string Ay(Match m) =>
        $"{m.Groups[2]}{m.Groups[1]}ay";
}