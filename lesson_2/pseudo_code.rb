=begin
a method that takes an array of strings, and returns a string that is all those strings concatenated together:
  - Initialize an empty result string variable
  - Iterate over the array of strings
    - add each element of array to the result string
  - RETURN result string
=end

# a method that takes an array of integers, and returns a new array with every other element from the original array, 
# starting with the first element. For instance:
everyOther([1,4,7,2,5]) # => [1,7,5]
=begin
  - Initialize an empty result array
  - Iterate over array
    - set counter to 0
    - WHILE counter <= arrray length
      - add element (at counter index) to result array
      - increment counter by 2
  - RETURN result array
=end

# a method that determines the index of the 3rd occurrence of a given character in a string. 
# For instance, if the given character is 'x' and the string is 'axbxcdxex', 
# the method should return 6 (the index of the 3rd 'x'). 
# If the given character does not occur at least 3 times, return nil

=begin
  - SET result to nil
  - SET occurences to 0
  - SET index to 0
  - Iterate over string chars
    - WHILE index < string length 
      - IF given_char == string at index
        - increment occurences by 1
        - IF occurences == 3
          - RETURN index
  - RETURN result
=end

# a method that takes two arrays of numbers and returns the result of merging the arrays. 
# The elements of the first array should become the elements at the even indexes of the returned array, 
# while the elements of the second array should become the elements at the odd indexes. 
# For instance:
merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]
# You may assume that both array arguments have the same number of elements.

=begin
  - Initialize empty result array
  - SET index counter to 0
  - WHILE index counter < length of array
    - add array1 at current index to result array
    - add array2 at current index to result array
    - increment index counter by 1
  - RETURN result array
=end