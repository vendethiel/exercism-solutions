LETTERS = Set(collect('a':'z'))
function ispangram(input)
    return 26 == length(intersect(Set(lowercase(input)), LETTERS))
end

