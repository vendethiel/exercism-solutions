difference_of_squares <- function(n) {
  sqofsum <- sum(seq(1, n)^2)
  sumofsq <- sum(seq(1, n))^2
  sumofsq - sqofsum
}
