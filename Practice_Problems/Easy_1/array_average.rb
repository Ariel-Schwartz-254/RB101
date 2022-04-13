=begin
  - Initialize a sum variable, set to 0
  - itarate over array using each
    - add each element to the sum
  RETURN sum divided by length of array
=end

def average(arr)
  sum = arr.reduce { |sum, num| sum + num }
  sum.to_f / arr.length
end

puts average([1, 6]) # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])