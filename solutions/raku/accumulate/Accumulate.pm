unit class Accumulate;

method accumulate($s, $fn) {
  [do for @$s {
    $fn($_);
  }]
}