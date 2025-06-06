# Encode a string using run-length encoding
# Ciphertext ? Plaintext
Encode ← (
  ⍚(⨬(⇌°⋕)⋅""=1.)°▽
  ↘1/◇⊂⊂" " ⍚∧⊂
)

# Decode a string encoded with run-length encoding
# Plaintext ? Ciphertext
Decode ← ⍣(/◇⊂≡⍜°□(⍣(▽⋕⇌:°⊂⇌))⊜□\+⍜⊢⋅1↻¯1↥⊃(≤@0|≥@9).)
