function encode(s)
    join(map(eachmatch(r"(.)\1*", s)) do m
        "$(length(m.match) > 1 ? length(m.match) : "")$(m.captures[1])"
    end)
end



function decode(s)
    join(map(eachmatch(r"(\d+)?(.)", s)) do m
        repeat(m.captures[2], parse(Int, @something m.captures[1] "1"))
    end)
end
