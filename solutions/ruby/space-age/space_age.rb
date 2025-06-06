class SpaceAge
  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    with_rate(1.0)
  end

  def on_mercury
    with_rate(0.2408467)
  end

  def on_venus
    with_rate(0.61519726)
  end

  def on_mars
    with_rate(1.8808158)
  end

  def on_jupiter
    with_rate(11.862615)
  end

  def on_saturn
    with_rate(29.447498)
  end

  def on_uranus
    with_rate(84.016846)
  end

  def on_neptune
    with_rate(164.79132)
  end

private
  def with_rate(n)
    (@seconds * (1 / n)) / 31557600
  end
end