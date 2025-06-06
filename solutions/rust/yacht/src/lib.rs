#[derive(Debug)]
pub enum Category {
    Ones,
    Twos,
    Threes,
    Fours,
    Fives,
    Sixes,
    FullHouse,
    FourOfAKind,
    LittleStraight,
    BigStraight,
    Choice,
    Yacht,
}

type Dice = [u8; 5];

fn sum(dice: Dice, mul: u8) -> u8 {
    mul * dice.iter().filter(|&f| *f == mul).count() as u8
}

fn all_equal(dice: Dice) -> bool {
    dice[0] == dice[4]
}

fn full_house(dice: Dice) -> u8 {
    let fst = dice[0] == dice[2] && dice[3] == dice[4];
    let snd = dice[0] == dice[1] && dice[2] == dice[4];
    if all_equal(dice) { 0 }
    else if fst || snd { dice.iter().sum::<u8>() }
    else { 0 }
}

fn foak(dice: Dice) -> u8 {
    if (dice[0] == dice[3]) || (dice[1] == dice[4]) { dice[1] * 4 }
    else { 0 }
}

fn little_straight(dice: Dice) -> u8 {
    if dice == [1, 2, 3, 4, 5] { 30 }
    else { 0 }
}

fn big_straight(dice: Dice) -> u8 {
    if dice == [2, 3, 4, 5, 6] { 30 }
    else { 0 }
}

fn choice(dice: Dice) -> u8 {
    dice.iter().sum::<u8>()
}

fn yacht(dice: Dice) -> u8 {
    if all_equal(dice) { 50 }
    else { 0 }
}

pub fn score(dice: Dice, category: Category) -> u8 {
    let mut dice = dice.clone();
    dice.sort();
    match category {
        Category::Ones => sum(dice, 1),
        Category::Twos => sum(dice, 2),
        Category::Threes => sum(dice, 3),
        Category::Fours => sum(dice, 4),
        Category::Fives => sum(dice, 5),
        Category::Sixes => sum(dice, 6),
        Category::FullHouse => full_house(dice),
        Category::FourOfAKind => foak(dice),
        Category::LittleStraight => little_straight(dice),
        Category::BigStraight => big_straight(dice),
        Category::Choice => choice(dice),
        Category::Yacht => yacht(dice)
    }
}
