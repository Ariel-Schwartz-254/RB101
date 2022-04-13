=begin
  - Initialize an empty string for the result
  - while the length of the result string is smaller than the argument num
    - IF result string length is even
      - add '1' to result
    - ELSE
      - add '0' to result
  - RETURN result
=end

def stringy(num, start = 1)
  result = ''
  while result.length < num
    if result.length.even?
      if start == 1
        result << '1'
      else
        result << '0'
      end
    elsif start == 1
      result << '0'
    else
      result << '1'
    end
  end
  result
end

puts stringy(6) == '101010'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7) == '1010101'