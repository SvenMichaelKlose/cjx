make_levenshtein = (row, column) ->
  width =  row.length
  height = column.length
  w =      width + 1
  h =      height + 1
  m =      []
  m[i] = [] for i in [0..w] by 1
  for i in [0..w] by 1
    for j in [0..h] by 1
      m[i][j] = 0
  for i in [0..w] by 1
    m[i][0] = i
  for j in [0..h] by 1
    m[0][j] = j
  for jc in [0..height] by 1
    for ic in [0..width] by 1
      i = ic + 1
      j = jc + 1
      m[i][j] = Math.min (m[ic][jc] + if row[ic] == column[jc] 0 else 1),
                         m[ic][j] + 1,
                         m[i][jc] + 1
  m

levenshtein = (row, column) ->
  (make_levenshtein row, column)[row.length][column.length]
