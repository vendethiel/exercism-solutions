Check            ← ⍤ "invalid nucleotide in strand" ⍜¬/+∊

# Count the four nucleotides in a DNA string
# Counts ? DNA
NucleotideCounts ← map⟜(/+⍉⊞=◡Check)"ACGT"
