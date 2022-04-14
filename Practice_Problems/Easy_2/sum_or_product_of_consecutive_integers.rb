=begin
  - Ask user for integer greater than 0
  - Ask user what they would like to compute. Sum or Product
  - IF user entered 's'
    - calculate result using sum
    - display result
  - ELSE
    - calculate result using product
    - display result
=end

puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
user_choice = gets.chomp

if user_choice == 's'
  result = (1..integer).inject(:+)
  puts "The sum of the integers between 1 and #{integer} is #{result}"
elsif user_choice == 'p'
  result = (1..integer).inject(:*)
  puts "The product of the integers between 1 and #{integer} is #{result}"
else
  puts "Unknown operation."
end

