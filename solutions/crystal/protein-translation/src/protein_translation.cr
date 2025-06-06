module ProteinTranslation
  MAPPING = {
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP",
    "UAG": "STOP",
    "UGA": "STOP",
  }

  def self.proteins(strand : String) : Array(String)
    strand.chars.in_slices_of(3).map do |x|
      MAPPING.fetch(x.join(""), "")
    end.take_while do |x|
      x != "STOP"
    end.tap do |xs|
      raise ArgumentError.new if xs.includes?("")
    end
  end
end
