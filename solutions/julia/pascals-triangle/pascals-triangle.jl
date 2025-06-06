function triangle(n)
    if n < 0
        throw(DomainError(n))
    end
    if n == 0
        return []
    end
    r = triangle(n - 1)
    if isempty(r)
      return [[1]]
    end
    l = r[end]
    return [
      r...,
      [0, l...] + [l..., 0]
    ]
end