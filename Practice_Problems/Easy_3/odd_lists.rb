=begin
  - Initialize a result array
  - Initialize counter
  - Iterate through original array
    - add element to result array
    - add 2 to counter
    - break if counter is longer than length of original array
  - return result array
=end

def oddities(arr)
  result = []
  count = 0
  loop do
    break if count >= arr.length

    result << arr[count]
    count += 2
  end
  result
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def evenities(arr)
  arr.select { |element| arr.index(element).odd?}
end

p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenities(['abc', 'def']) == ['def']
p evenities([123]) == []
p evenities([]) == []

def additionl_even(arr)
  even_elements = []
  arr.each_with_index do |element, index|
    even_elements << element if index.odd?
  end
  even_elements
end

p additionl_even([2, 3, 4, 5, 6]) == [3, 5]
p additionl_even([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p additionl_even(['abc', 'def']) == ['def']
p additionl_even([123]) == []
p additionl_even([]) == []