unit class Grains;

method square($n) {
  2 ** ($n - 1)
}

method total { Grains.square(64 + 1) - 1; } # ??????