from std/algorithm import sort, reverse
from std/math import floor
from std/random import randomize, rand
from std/sequtils import foldl

type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

randomize()

proc ability*: int =
  var xs = @[rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
  xs.sort()
  xs.reverse()
  discard xs.pop()
  return xs.foldl(a + b)

proc modifier*(n: int): int =
  return floor((n - 10) / 2).int

proc initCharacter*: Character =
  var strength = ability()
  var dexterity = ability()
  var constitution = ability()
  var intelligence = ability()
  var wisdom = ability()
  var charisma = ability()
  var hitpoints = 10 + modifier(constitution)
  return Character(
    strength: strength,
    dexterity: dexterity,
    constitution: constitution,
    intelligence: intelligence,
    wisdom: wisdom,
    charisma: charisma,
    hitpoints: hitpoints,
  )