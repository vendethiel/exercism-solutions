"Your optional docstring here"
function distance(a, b)
    if length(a) != length(b)
        throw(ArgumentError("Incompatible lengths"))
    end
    sum([x != y for (x, y) in zip(a, b)])
end
