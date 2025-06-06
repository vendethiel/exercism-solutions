Assert ← ⍤?"invalid codon"¬≍"ERR"°□
Parse ← □⍣(
  "Methionine" °"AUG"
| "Phenylalanine" ⍣(°"UUU"|°"UUC")
| "Leucine" ⍣(°"UUA"|°"UUG")
| "Serine" ⍣(°"UCU"|°"UCC"|°"UCA"|°"UCG")
| "Tyrosine" ⍣(°"UAU"|°"UAC")
| "Cysteine" ⍣(°"UGU"|°"UGC")
| "Tryptophan" °"UGG"
| "STOP" ⍣(°"UAA"|°"UAG"|°"UGA")
| "ERR")
Proteins ← (
  ∵₁(⊸Assert Parse) ⬚@\s↯∞_3
  ↙/↥⊸⊗{"STOP"}
)