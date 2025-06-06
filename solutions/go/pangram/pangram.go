package pangram

func IsPangram(input string) bool {
    set := make(map[int]bool)
    for _, letter := range input {
        l := int(letter)
        if l >= int('a') && l <= int('z') {
            set[l] = true
        }
    	if l >= int('A') && l <= int('Z') {
            set[l + 32] = true
        }
    }
    return len(set) == 26
}
