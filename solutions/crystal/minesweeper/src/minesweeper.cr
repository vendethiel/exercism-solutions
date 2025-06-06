class Point
  getter x : Int32
  getter y : Int32

  def initialize(@x : Int32, @y : Int32)
  end

  def in_or(xs, default = nil)
    if x >= 0 && x < xs.size && y >= 0 && y < xs[x].size
      xs[x][y]
    else
      default
    end
  end

  def eight_neighbors
    [
      Point.new(x - 1, y - 1),
      Point.new(x - 1, y),
      Point.new(x - 1, y + 1),
      Point.new(x, y - 1),
      Point.new(x, y + 1),
      Point.new(x + 1, y - 1),
      Point.new(x + 1, y),
      Point.new(x + 1, y + 1),
    ]
  end
end

class Minesweeper
  def initialize(@board : Array(String))
  end

  def is_bomb?(l)
    l == '*'
  end

  def bomb_at?(point)
    is_bomb?(point.in_or(@board, ' '))
  end

  def format(cnt)
    if cnt == 0
      ' '
    else
      cnt
    end
  end

  def annotate
    @board.map_with_index do |line, i|
      line.chars.map_with_index do |l, j|
        point = Point.new(i, j)
        if is_bomb?(l)
          l
        else
          format(point.eight_neighbors.count { |neighbor| bomb_at?(neighbor) })
        end
      end.join("")
    end
  end
end
