use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {
    let s: Vec<char> = candidate
        .to_ascii_uppercase()
        .chars()
        .filter(|c| *c >= 'A' && *c <= 'Z')
        .collect();
    s.len() == s.into_iter().collect::<HashSet<_>>().len()
}
