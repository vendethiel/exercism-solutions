raindrops <- function(number) {
  i <- if (number %% 3 == 0) "Pling" else ""
  a <- if (number %% 5 == 0) "Plang" else "" 
  o <- if (number %% 7 == 0) "Plong" else ""
  if (i == "" && a == "" && o == "") as.character(number)
  else sprintf("%s%s%s", i, a, o)
}
