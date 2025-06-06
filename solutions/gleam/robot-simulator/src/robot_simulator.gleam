import gleam/list
import gleam/result
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

fn left(d: Direction) -> Direction {
  case d {
    North -> West
    East -> North
    South -> East
    West -> South
  }
}

fn right(d: Direction) -> Direction {
  // no comment
  left(left(left(d)))
}

fn offset(d: Direction) -> Position {
  case d {
    East -> Position(1, 0)
    West -> Position(-1, 0)
    North -> Position(0, 1)
    South -> Position(0, -1)
  }
}

fn advance(p: Position, offset: Position) {
  Position(p.x + offset.x, p.y + offset.y)
}

fn step(r: Robot, c: String) -> Result(Robot, String) {
  case c {
    "L" -> Ok(Robot(..r, direction: left(r.direction)))
    "R" -> Ok(Robot(..r, direction: right(r.direction)))
    "A" -> Ok(Robot(..r, position: advance(r.position, offset(r.direction))))
    _ -> Error("Unknown instruction")
  }
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let robot = Robot(direction, position)
  instructions
  |> string.to_graphemes
  |> list.try_fold(robot, step)
  |> result.unwrap(robot)
}
