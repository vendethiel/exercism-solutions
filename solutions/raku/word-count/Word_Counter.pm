unit class Word_Counter;

method count_words($s) {
  $s.lc.subst(/<-[a..z 1..9 \  ]>/, '', :g).words.Bag.hash
}