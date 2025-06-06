class PascalsTriangle
  rows: (num) ->
    return [] unless num
    cur = @rows num - 1
    last = cur[cur.length - 1] ? []
    [cur..., for i in [0..last.length]
      if i == 0
      then 1
      else (last[i] ? 0) + last[i - 1]
    ]
      

module.exports = PascalsTriangle
