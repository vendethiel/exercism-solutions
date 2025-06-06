pub fn collatz(n: u64) -> Option<u64> {
    if n == 0 { None }
    else if n == 1 { Some(0) }
    else { collatz(if n % 2 == 0 { n/2 } else { n * 3 + 1 }).map(|x| x + 1) }
}
