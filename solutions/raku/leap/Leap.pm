unit class Leap;

method is_leap($n) {
  $n %% 4 && ($n !%% 100 || $n %% 400)
}