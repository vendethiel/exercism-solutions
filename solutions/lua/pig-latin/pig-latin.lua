local function ay(a, b)
  if a then
    return (b or "") .. a .. "ay"
  end
end
local function vowel_xr_yt(word)
  return ay(word:match('^([aeiou].*)') or word:match('^(xr.*)') or word:match('^(yt.*)'))
end
local function y(word)
  return ay(word:match("^([^aiueo]+)(y.*)$"))
end
local function qu(word)
  return ay(word:match("^([^aiueo]*qu)(.*)$"))
end
local function consonant(word)
  return ay(word:match("^([^aiueo]+)(.*)$"))
end
local function convert(word)
  return vowel_xr_yt(word) or y(word) or qu(word) or consonant(word)
end

return function(phrase)
  local words = {}
  for word in phrase:gmatch("%S+") do
    table.insert(words, convert(word))
  end
  return table.concat(words, " ")
end
