.maximumWeight as $max |
.items as $items |

[
  $items |
  [range(length)] |
  combinations($items | length) |
  unique |
  map($items[.]) |
  select(map(.weight) | add <= $max) |
  map(.value) |
  add
] |
. += [0] |
max
