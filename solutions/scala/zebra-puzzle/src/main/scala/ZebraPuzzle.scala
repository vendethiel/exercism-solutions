object ZebraPuzzle {

  sealed trait Resident
  case object Englishman extends Resident
  case object Spaniard extends Resident
  case object Ukrainian extends Resident
  case object Norwegian extends Resident
  case object Japanese extends Resident

  sealed trait Color
  case object Red extends Color
  case object Green extends Color
  case object Yellow extends Color
  case object Blue extends Color
  case object Ivory extends Color

  sealed trait Pet
  case object Dog extends Pet
  case object Snail extends Pet
  case object Fox extends Pet
  case object Horse extends Pet
  case object Zebra extends Pet

  sealed trait Beverage
  case object Coffee extends Beverage
  case object Tea extends Beverage
  case object Milk extends Beverage
  case object OrangeJuice extends Beverage
  case object Water extends Beverage

  sealed trait CigaretteBrand
  case object OldGold extends CigaretteBrand
  case object Kools extends CigaretteBrand
  case object Chesterfield extends CigaretteBrand
  case object LuckyStrike extends CigaretteBrand
  case object Parliaments extends CigaretteBrand
  
  case class House(resident: Resident, color: Color, pet: Pet, beverage: Beverage, cigBrand: CigaretteBrand) {
    def hasEqual(other: House) =
      resident == other.resident ||
      color == other.color ||
      pet == other.pet ||
      beverage == other.beverage ||
      cigBrand == other.cigBrand
  }
  
  case class Solution(waterDrinker: Resident, zebraOwner: Resident)

  val RESIDENTS = Seq(Englishman, Spaniard, Ukrainian, Norwegian, Japanese)
  val COLORS = Seq(Red, Green, Yellow, Blue, Ivory)
  val PETS = Seq(Dog, Snail, Fox, Horse, Zebra)
  val BEVERAGES = Seq(Coffee, Tea, Milk, OrangeJuice, Water)
  val CIGARETTE_BRANDS = Seq(OldGold, Kools, Chesterfield, LuckyStrike, Parliaments)
  
  
  lazy val solve: Solution = {
    val potential = for {
      resident <- RESIDENTS
      color <- COLORS
      pet <- PETS
      beverage <- BEVERAGES
      cigBrand <- CIGARETTE_BRANDS
      if (resident == Englishman) == (color == Red)
      if (resident == Spaniard) == (pet == Dog)
      if (beverage == Coffee) == (color == Green)
      if (resident == Ukrainian) == (beverage == Tea)
      if (cigBrand == OldGold) == (pet == Snail)
      if (cigBrand == Kools) == (color == Yellow)
      if (cigBrand == LuckyStrike) == (beverage == OrangeJuice)
      if (resident == Japanese) == (cigBrand == Parliaments)
    } yield House(resident, color, pet, beverage, cigBrand)
    
    def as(taken: Seq[House]) = potential.view.filterNot(p => taken.exists(_.hasEqual(p)))
    
    def greenIvory(lft: House, rgt: House) = lft.color == Ivory && rgt.color == Green // #6

    def checkChesterFox(a: House, b: House) = a.cigBrand == Chesterfield && b.pet == Fox
    def chesterFox(a: House, b: House) = checkChesterFox(a, b) || checkChesterFox(b, a) // #11
    
    def checkKoolsHorse(a: House, b: House) = a.cigBrand == Kools && b.pet == Horse
    def koolsHorse(a: House, b: House) = checkKoolsHorse(a, b) || checkKoolsHorse(b, a) // #12
    
    def checkNorwayBlue(a: House, b: House) = a.color == Blue && b.resident == Norwegian
    def norwayBlue(a: House, b: House) = checkNorwayBlue(a, b) || checkNorwayBlue(b, a) // #15

    val houses = for {
      h1 <- as(Seq.empty)
      if h1.resident == Norwegian
      h2 <- as(Seq(h1))
      if h2.color == Blue // #15
      h3 <- as(Seq(h1, h2))
      if h3.beverage == Milk // #9
      h4 <- as(Seq(h1, h2, h3))
      h5 <- as(Seq(h1, h2, h3, h4))
      if h5.color != Ivory // #6 (impl)
      if greenIvory(h1, h2) || greenIvory(h2, h3) || greenIvory(h3, h4) || greenIvory(h4, h5) // #6
      if chesterFox(h1, h2) || chesterFox(h2, h3) || chesterFox(h3, h4) || chesterFox(h4, h5) // #11
      if koolsHorse(h1, h2) || koolsHorse(h2, h3) || koolsHorse(h3, h4) || koolsHorse(h4, h5) // #12
      if norwayBlue(h1, h2) || norwayBlue(h2, h3) || norwayBlue(h3, h4) || norwayBlue(h4, h5) // #15
    } yield Seq(h1, h2, h3, h4, h5)
    val found = houses.head
    Solution(found.filter(_.beverage == Water).head.resident, found.filter(_.pet == Zebra).head.resident)
  }
}

