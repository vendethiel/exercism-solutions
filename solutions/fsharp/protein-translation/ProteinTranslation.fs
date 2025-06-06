module ProteinTranslation

let convert = function
| "AUG" -> "Methionine"
| "UUU" | "UUC" -> "Phenylalanine"
| "UUA" | "UUG" -> "Leucine"
| "UCU" | "UCC" | "UCA" | "UCG" -> "Serine"
| "UAU" | "UAC" -> "Tyrosine"
| "UGU" | "UGC" -> "Cysteine"
| "UGG" -> "Tryptophan"
| _ -> "STOP"

let proteins: string -> string list =
    Seq.toArray
    >> Array.chunkBySize 3
    >> Array.map System.String
    >> Array.map convert
    >> Array.takeWhile ((<>) "STOP")
    >> Array.toList