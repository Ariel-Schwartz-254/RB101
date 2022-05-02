=begin
  - check if first char is + or -
  - IF char is plus
    - remove first char from string
    - save sign to a variable and set it to +1
  - ELSIF char is minus
    - remove first char from string
    - save sign to a variable and set it to -1
  - ELSE
    - save sign to a variable and set it to +1

  - call string_to_integer on the result string
  - multiply result string by the sign
  - RETURN result
=end

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

def string_to_signed_integer(string)
  sign = 1
  first_char = string[0]
  if first_char == '-'
    sign = -1
  elsif first_char != '+'
    return string_to_integer(string)
  end

  string_to_integer(string[1..-1]) * sign
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100