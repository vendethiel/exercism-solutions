unit class Bob;

multi method hey(Str $str where /<:Letter>/ & !/<:Lower>/) {
  'Whoa, chill out!'
}
multi method hey(Str $str where /'?'$/) is export {
  'Sure.'
}
multi method hey(Str $str where !$str.trim) {
  'Fine. Be that way!'
}

multi method hey(Str) {
  'Whatever.'
}