local function product(n)
  local t = 1
  for i = 1, #n do
    t = t * tonumber(n:sub(i, i))
  end
  return t
end

return function(config)
  local span, digits = config.span, config.digits
  if span > #digits or span < 1 or digits:match("%D") then
    error('bad')
  end
  local highest = -1
  for i = 1, #digits - span + 1 do
    local cur = product(digits:sub(i, i + span - 1))
    if cur > highest then
      highest = cur
    end
  end
  return highest
end
