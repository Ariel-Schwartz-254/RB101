=begin
  - 0 is an edge case
  - calculate sign
    - IF num > 0 ? : + : -
  - convert string
    - use integer_to_string method
  - prepend sign to string
  -RETURN string
=end

DIGITS = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(num)
  string = ''
  loop do
    last_digit = num % 10
    string << DIGITS[last_digit]
    num /= 10
    break if num == 0
  end
  string.reverse
end

def signed_integer_to_string(num)
  return integer_to_string(num) if num == 0
  sign = num > 0 ? '+' : '-'
  number = num > 0 ? num : -num
  sign + integer_to_string(number)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'