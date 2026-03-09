function to_rna(dna)
    if "GCTA" ⊉ dna
        throw(ErrorException("Invalid sequence"))
    end
    replace(dna, 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')
end

