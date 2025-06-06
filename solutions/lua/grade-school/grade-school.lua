local School = {}
School.__index = School

function School:new()
    return setmetatable({ grades = {} }, self)
end

function School:roster()
    return self.grades
end

function School:add(student, grade)
    xs = self.grades[grade] or {}
    table.insert(xs, student)
    table.sort(xs)
    self.grades[grade] = xs
end

function School:grade(grade)
    return self.grades[grade] or {}
end

return School
