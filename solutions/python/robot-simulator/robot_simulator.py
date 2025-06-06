from enum import Enum


class Direction(Enum):
    EAST = 0
    NORTH = 1
    WEST = 2
    SOUTH = 3


EAST = Direction.EAST
NORTH = Direction.NORTH
WEST = Direction.WEST
SOUTH = Direction.SOUTH

type Coordinates = tuple[int, int]


def direction_offset(direction: Direction) -> Coordinates:
    match direction:
        case Direction.EAST:
            return 1, 0
        case Direction.WEST:
            return -1, 0
        case Direction.NORTH:
            return 0, 1
        case Direction.SOUTH:
            return 0, -1


class Robot:
    direction: Direction
    coordinates: Coordinates

    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.direction = direction
        self.coordinates = (x_pos, y_pos)

    def move(self, param: str):
        for char in param:
            match char:
                case 'L':
                    self.offset_direction(+1)
                case 'R':
                    self.offset_direction(-1)
                case 'A':
                    self.advance(direction_offset(self.direction))

    def offset_direction(self, n: int):
        v = self.direction.value
        self.direction = Direction((4 + v + n) % 4)

    def advance(self, coords: Coordinates):
        (x, y) = self.coordinates
        (off_x, off_y) = coords
        self.coordinates = (x + off_x, y + off_y)
