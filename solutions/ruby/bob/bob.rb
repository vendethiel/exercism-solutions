class Bob
  def self.hey(remark)
    case remark
    in /\A(?=.*[A-Z])[^a-z]*\?\Z/
      "Calm down, I know what I'm doing!"
    in /\A(?=.*[A-Z])[^a-z]*\Z/
      "Whoa, chill out!"
    in /\?\s*\Z/
      "Sure."
    in /\A\s*\Z/
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end
end