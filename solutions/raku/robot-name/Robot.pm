unit class Robot;

has $!name;

method name {
  $!name //= ('A'..'Z').pick(2).join('') ~ (0..9).pick(3).join('')
}

method reset_name { $!name = '' }