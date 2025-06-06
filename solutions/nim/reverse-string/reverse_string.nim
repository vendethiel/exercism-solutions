import std/algorithm
proc reverse*(s: string): string =
  return cast[string](reversed(s))