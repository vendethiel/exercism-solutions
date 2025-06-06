using System;
using System.Linq;
public static class ProteinTranslation
{
    public static string[] Proteins(string strand)
    {
        return strand
            .Chunk(3)
            .Select(x => new string(x))
            .Select(Convert)
            .TakeWhile(x => x is not null)
            .ToArray();
    }

    private static string Convert(string tri) {
        return tri switch {
            "AUG" => "Methionine",
            "UUU" or "UUC" => "Phenylalanine",
            "UUA" or "UUG" => "Leucine",
            "UCU" or "UCC" or "UCA" or "UCG" => "Serine",
            "UAU" or "UAC" => "Tyrosine",
            "UGU" or "UGC" => "Cysteine",
            "UGG" => "Tryptophan",
            _ => null,
        };
    }
}