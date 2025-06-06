// @ts-check

/** @typedef {("Norwegian"|"Englishman"|"Spaniard"|"Ukrainian"|"Japanese")} Nationality */

/** @typedef {("red"|"green"|"yellow"|"blue"|"ivory")} Color */

/** @typedef {("dog"|"snail"|"fox"|"horse"|"zebra")} Pet */

/** @typedef {("coffee"|"tea"|"milk"|"orange-juice"|"water")} Beverage */

/** @typedef {("old-gold"|"kools"|"chesterfield"|"lucky-strike"|"parliaments")} CigaretteBrand */

/** @type {Nationality[]} */
const NATIONALITIES = [
  "Norwegian",
  "Englishman",
  "Spaniard",
  "Ukrainian",
  "Japanese",
];

/** @type {Color[]} */
const COLORS = ["red", "green", "yellow", "blue", "ivory"];

/** @type {Pet[]} */
const PETS = ["dog", "snail", "fox", "horse", "zebra"];

/** @type {Beverage[]} */
const BEVERAGES = ["coffee", "tea", "milk", "orange-juice", "water"];

/** @type {CigaretteBrand[]} */
const CIGARETTE_BRANDS = [
  "old-gold",
  "kools",
  "chesterfield",
  "lucky-strike",
  "parliaments",
];

class House {
  /** @type {Nationality} */
  resident;
  /** @type {Color} */
  color;
  /** @type {Pet} */
  pet;
  /** @type {Beverage} */
  beverage;
  /** @type {CigaretteBrand} */
  cigBrand;

  /**
   *
   * @param {Nationality} resident
   * @param {Color} color
   * @param {Pet} pet
   * @param {Beverage} beverage
   * @param {CigaretteBrand} cigBrand
   */
  constructor(resident, color, pet, beverage, cigBrand) {
    this.resident = resident;
    this.color = color;
    this.pet = pet;
    this.beverage = beverage;
    this.cigBrand = cigBrand;
  }

  /**
   * 
   * @param {House} h 
   * @returns {Boolean}
   */
  similarTo(h) {
    return h.resident === this.resident
        || h.color === this.color
        || h.pet === this.pet
        || h.beverage === this.beverage
        || h.cigBrand === this.cigBrand;
  }
}

function* Houses() {
  for (const nationality of NATIONALITIES)
    for (const color of COLORS)
      for (const pet of PETS)
        for (const beverage of BEVERAGES)
          for (const cigBrand of CIGARETTE_BRANDS)
            yield new House(nationality, color, pet, beverage, cigBrand);
}

function* PossibleHouses() {
  for (const house of Houses()) {
    if ((house.resident === "Englishman") !== (house.color === "red")) continue;
    if ((house.resident === "Spaniard") !== (house.pet === "dog")) continue;
    if ((house.beverage === "coffee") !== (house.color === "green")) continue;
    if ((house.resident === "Ukrainian") !== (house.beverage === "tea")) continue;
    if ((house.cigBrand === "old-gold") !== (house.pet === "snail")) continue;
    if ((house.cigBrand === "kools") !== (house.color === "yellow")) continue;
    if ((house.cigBrand === "lucky-strike") !== (house.beverage === "orange-juice")) continue;
    if ((house.cigBrand === "parliaments") !== (house.resident === "Japanese")) continue;
    yield house;
  }
}

/**
 * @param {House[]} houses
 */
function* PossibleHousesExcept(...houses) {
  for (const house of PossibleHouses()) {
    if (houses.some(h => h.similarTo(house)))
      continue;
    yield house;
  }
}

function* Village() {
  for (const h1 of PossibleHouses())
    for (const h2 of PossibleHousesExcept(h1))
      for (const h3 of PossibleHousesExcept(h1, h2))
        for (const h4 of PossibleHousesExcept(h1, h2, h3))
          for (const h5 of PossibleHousesExcept(h1, h2, h3, h4))
        yield [h1, h2, h3, h4, h5];
}

/**
 * @callback Predicate
 * @param {House} a
 * @param {House} b
 * @returns {boolean}
 */

/**
 * @param {Predicate} f
 */
function ambivalent(f) {
  return (/** @type {House} */ a, /** @type {House} */ b) => f(a, b) || f(b, a);
}

/**
 * @type {Predicate}
 */
const chesterFox = ambivalent((a, b) => a.cigBrand === "chesterfield" && b.pet === "fox");

/**
 * @type {Predicate}
 */
const koolsHorse = ambivalent((a, b) => a.cigBrand === "kools" && b.pet === "horse");

/**
 * @type {Predicate}
 */
const norwayBlue = ambivalent((a, b) => a.color === "blue" && b.resident === "Norwegian");

/**
 * @type {Predicate}
 */
function greenIvory(lft, rgt) {
  return lft.color === "ivory" && rgt.color === "green";
}

/**
 * @param {Predicate} f
 * @param {House} h1
 * @param {House} h2
 * @param {House} h3
 * @param {House} h4
 * @param {House} h5
 */
function villageCheck(f, h1, h2, h3, h4, h5) {
  return f(h1, h2) || f(h2, h3) || f(h3, h4) || f(h4, h5);
}

function* Solution() {
  for (const [h1, h2, h3, h4, h5] of Village()) {
    if (h1.resident !== "Norwegian") continue;
    if (h2.color !== "blue") continue;
    if (h3.beverage !== "milk") continue;
    if (h5.color === "ivory") continue;
    if (!villageCheck(greenIvory, h1, h2, h3, h4, h5)) continue;
    if (!villageCheck(chesterFox, h1, h2, h3, h4, h5)) continue;
    if (!villageCheck(koolsHorse, h1, h2, h3, h4, h5)) continue;
    if (!villageCheck(norwayBlue, h1, h2, h3, h4, h5)) continue;
    yield [h1, h2, h3, h4, h5];
  }
}


export class ZebraPuzzle {
  /** @type {House[]} */
  solution;

  constructor() {
    const solution = Solution().next().value;
    if (solution == null) throw new Error("No solution found :(");
    this.solution = solution;
  }

  waterDrinker() {
    return this.solution.find((h) => h.beverage === "water")?.resident;
  }

  zebraOwner() {
    return this.solution.find((h) => h.pet === "zebra")?.resident;
  }

}
