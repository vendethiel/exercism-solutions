def isdiv(a, b):
    return (a % b) == 0

def leap_year(year):
    return isdiv(year, 4) and (isdiv(year, 400) or not isdiv(year, 100))