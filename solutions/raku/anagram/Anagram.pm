unit class Anagram;

method match($w is copy, @p) {
  $w.=lc;
  $[@p.grep({.lc.comb.sort eq $w.comb.sort}).grep(*.lc ne $w)]
}