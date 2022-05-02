=begin
- initialize a current total variable to 0
- iterate over array using map 
  - add current total to current element
- RETURN new array
=end

def running_total(arr)
  current_total = 0
  arr.each_with_object([]) do |num, new_arr| 
    current_total += num
    new_arr << current_total
  end
end
  
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
