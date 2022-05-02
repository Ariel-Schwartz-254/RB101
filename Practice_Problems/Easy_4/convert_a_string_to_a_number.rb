=begin
- Initialize an int_num variable
- Create an array of digits using char method
- Iterate over the array
  - multiply int_num by 10
  - convert digit to integer (helper method)
  - add digit to int_num

- Return int_num

- digit_to_integer method
  - Method takes in a one char string as an argument
  - Using a CASE statement return the appropriate num as an integer
=end

DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
            'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15 }

def digit_to_integer(digit)
  case digit
  when '0'
    0
  when '1'
    1
  when '2'
    2
  when '3'
    3
  when '4'
    4
  when '5'
    5
  when '6'
    6
  when '7'
    7
  when '8'
    8
  when '9'
    9
  end
end

def string_to_integer(string)
  digits = string.chars
  int_num = 0
  digits.each do |digit|
    int_num *= 10
    int_digit = digit_to_integer(digit)
    int_num += int_digit
  end
int_num
end

def hexadecimal_to_integer(string)
  values = string.chars.map { |char| DIGITS[char] }

  values.inject { |sum, value| sum * 16 + value}
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

p hexadecimal_to_integer('4D9F') == 19871