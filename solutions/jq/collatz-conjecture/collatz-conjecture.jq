def steps:
  if . < 1 then
    "Only positive integers are allowed" | halt_error
  elif . == 1 then
    0
  elif . % 2 == 0 then
    . / 2 | steps | . + 1
  else
    . * 3 + 1 | steps | . + 1
  end
;