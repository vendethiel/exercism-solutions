from std/bitops import bitand
from std/sequtils import toSeq, filterIt
from std/enumutils import items
from std/setutils import toSet

type
  Allergen* = enum
    Eggs = 1
    Peanuts = 2
    Shellfish = 4
    Strawberries = 8
    Tomatoes = 16
    Chocolate = 32
    Pollen = 64
    Cats = 128

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  return bitand(score, ord(allergen)) != 0

{.warning[HoleEnumConv]:off.}
proc allergies*(score: int): set[Allergen] =
  return Allergen.items
    .toSeq
    .filterIt(isAllergicTo(score, it))
    .toSet
