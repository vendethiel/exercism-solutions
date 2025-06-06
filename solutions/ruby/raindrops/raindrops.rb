class Raindrops
  def self.convert(i)
    s = "#{"Pling" if i % 3 == 0}#{"Plang" if i % 5 == 0}#{"Plong" if i % 7 == 0}"
    s.empty? ? i.to_s : s
  end
end