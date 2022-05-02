=begin
  - initialize a new empty string variable
  - iterate over num 
    - isolate last digit
      - num % 10
    - convert digit into char
      - create a constant hash with digits from 0-9 
    - add char to new string
    - divide num by 10
    - BREAK if num is zero
  - RETURN reversed string
  
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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'