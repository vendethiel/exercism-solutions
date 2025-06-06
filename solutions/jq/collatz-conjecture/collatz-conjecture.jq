def steps:
  if . < 1 then
    "Only positive integers are allowed" | halt_error
  else if . == 1 then
    0
  else if . % 2 == 0 then
    . / 2 | steps | . + 1
  else
    . * 3 + 1 | steps | . + 1
  end end end
;