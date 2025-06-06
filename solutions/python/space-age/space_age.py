class SpaceAge:
    def __init__(self, seconds):
        self.seconds = seconds

    def on_earth(self):
        return self._with_rate(1.0)

    def on_mercury(self):
        return self._with_rate(0.2408467)

    def on_venus(self):
        return self._with_rate(0.61519726)

    def on_mars(self):
        return self._with_rate(1.8808158)

    def on_jupiter(self):
        return self._with_rate(11.862615)

    def on_saturn(self):
        return self._with_rate(29.447498)

    def on_uranus(self):
        return self._with_rate(84.016846)

    def on_neptune(self):
        return self._with_rate(164.79132)

    def _with_rate(self, n):
        return round(self.seconds * (1 / n) / 31557600, 2)