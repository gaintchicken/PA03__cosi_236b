arr = Array.new(4){Array.new(4){4}}
puts arr.to_s
arr[0][0] = 'x'
arr[1][0] = 'y'
arr[1][1] = 'z'
puts arr.to_s