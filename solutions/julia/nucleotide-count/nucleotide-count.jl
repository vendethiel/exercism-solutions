"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand::String)
    if "AGCT" ⊉ strand
        throw(DomainError(strand, "Strands should only include AGCT"))
    end
    Dict([(l, count(l, strand)) for l in "AGCT"])
end
