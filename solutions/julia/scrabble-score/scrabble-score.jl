function score(str)
    s = uppercase(str)
    count(⊆("AEIOULNRST"), s)    +
        count(⊆("DG"), s)    * 2 +
        count(⊆("BCMP"), s)  * 3 +
        count(⊆("FHVWY"), s) * 4 +
        count(⊆("K"), s)    * 5 +
        count(⊆("JX"), s)    * 8 +
        count(⊆("QZ"), s)    * 10
end
