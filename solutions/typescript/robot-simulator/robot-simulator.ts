export class InvalidInputError extends Error {
  constructor(message?: string) {
    super();
    this.message = message || 'Invalid Input';
  }
}

type Direction = 'north' | 'east' | 'south' | 'west'
type Coordinates = [number, number]

const directions: Direction[] = ['north', 'east', 'south', 'west'];

function getOffset(direction: Direction): Coordinates {
  switch (direction) {
    case 'north':
      return [0, 1];
    case 'east':
      return [1, 0];
    case 'south':
      return [0, -1];
    case 'west':
      return [-1, 0];
  }
}

export class Robot {
  bearing: Direction;
  coordinates: Coordinates;

  constructor() {
    this.bearing = 'north';
    this.coordinates = [0, 0];
  }

  place({x, y, direction}: { x: number; y: number; direction: string }) {
    if (direction !== 'north'
     && direction !== 'east'
     && direction !== 'south'
     && direction !== 'west') {
      throw new InvalidInputError();
    }
    this.bearing = direction;
    this.coordinates = [x, y];
  }

  evaluate(instructions: string) {
    instructions.split('').forEach((c) => {
      switch (c) {
        case 'A': {
          const [offsetX, offsetY] = getOffset(this.bearing);
          this.coordinates[0] += offsetX;
          this.coordinates[1] += offsetY;
          break;
        }
        case 'L':
          this.offsetBearing(-1);
          break;
        case 'R':
          this.offsetBearing(1);
          break;
        default:
          throw new InvalidInputError();
      }
    })
  }

  private offsetBearing(n: number) {
    const l = directions.length;
    const i = (l + directions.indexOf(this.bearing) + n) % l;
    this.bearing = directions[i];
  }
}
