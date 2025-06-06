def subsets:
  if length > 0 then (.[:1] + (.[1:] | subsets)), (.[1:] | subsets) end;

.maximumWeight as $max |
.items as $items |

[
  $items |
  [range(length)] |
  subsets |
  map($items[.]) |
  select(map(.weight) | add <= $max) |
  map(.value) |
  add
] |
max // 0
