def rec_intersection(rect1, rect2)
  x_min = [rect1[0][0], rect2[0][0]].max
  x_max = [rect1[1][0], rect2[1][0]].min

  y_min = [rect1[0][1], rect2[0][1]].max
  y_max = [rect1[1][1], rect2[1][1]].min

  return nil if ((x_max < x_min) || (y_max < y_min))
  return [[x_min, y_min], [x_max, y_max]]
end
