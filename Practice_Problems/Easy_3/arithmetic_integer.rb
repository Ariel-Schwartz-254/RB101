=begin
  - ask user for first num
  - ask user for second num
  - calculate addition
  - display addition
  - calculate subtraction
  - display subtraction
  -etc...
=end

puts "==> Enter the first number:"
first_num = gets.chomp.to_i

puts "==> Enter the second number:"
second_num = gets.chomp.to_i

addition = first_num + second_num
subtraction = first_num - second_num
product = first_num * second_num
quotient = first_num / second_num
remainder = first_num % second_num
power = first_num ** second_num

puts "==> #{first_num} + #{second_num} = #{addition}"
puts "==> #{first_num} - #{second_num} = #{subtraction}"
puts "==> #{first_num} * #{second_num} = #{product}"
puts "==> #{first_num} / #{second_num} = #{quotient}"
puts "==> #{first_num} % #{second_num} = #{remainder}"
puts "==> #{first_num} ** #{second_num} = #{power}"