def binary_search(object, array, offset = 0)
  mid_point = (array.length-1)/2

  if array[mid_point] == object
    return mid_point + offset
  end

  if array[mid_point] < object 
    offset += mid_point + 1
    binary_search(object, array[(mid_point+1)..-1], offset)
  elsif array[mid_point] > object
    binary_search(object, array[0..(mid_point-1)], offset)
  end
end

array = (100..200).to_a
p binary_search(112, array)
