=begin
- Initialize an empty result array
- Iterate over the range of 1..input
  - IF num % 3 == 0 OR num % 5 == 0
    - add num to array
- return the sum of the array elements using inject
=end

def multisum(num)
  multiples = []
  (1..num).each do |element|
    multiples << element if (element % 3 == 0 || element % 5 == 0)
  end
  multiples.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168