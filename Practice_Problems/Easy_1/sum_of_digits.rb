=begin
  - create array of digits using the digits method
  - calculate the sum of these digits using inject
  - RETURN sum
=end

def sum(int)
  digits = int.digits
  digits.inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45