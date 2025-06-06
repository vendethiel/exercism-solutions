mappings = [
    (base = 1000, roman = "M"),
    (base = 900, roman = "CM"),
    (base = 500, roman = "D"),
    (base = 400, roman = "CD"),
    (base = 100, roman = "C"),
    (base = 90, roman = "XC"),
    (base = 50, roman = "L"),
    (base = 40, roman = "XL"),
    (base = 10, roman = "X"),
    (base = 9, roman = "IX"),
    (base = 5, roman = "V"),
    (base = 4, roman = "IV"),
    (base = 1, roman = "I")
]

function to_roman(number)
    number > 0 || error("boo")
    s = ""
    while number > 0
        for (;base, roman) ∈ mappings
            if number >= base
                number -= base
                s *= roman
                break
            end
        end
    end
    s
end
