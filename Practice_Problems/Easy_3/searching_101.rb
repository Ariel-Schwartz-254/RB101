=begin
  - initialize an empty array to contain the numbers input
  - iterate 5 times
    - ask for nth number
    - add number to array
  - ask for final number
  - check if number appears in array
  - display results
=end

arr = []

puts "Enter the 1st number:"
arr << gets.chomp.to_i
puts "Enter the 2nd number:"
arr << gets.chomp.to_i
puts "Enter the 3rd number:"
arr << gets.chomp.to_i
puts "Enter the 4th number:"
arr << gets.chomp.to_i
puts "Enter the 5th number:"
arr << gets.chomp.to_i

puts "Enter the last number:"
last_num = gets.chomp.to_i

if arr.include?(last_num)
  puts "The number #{last_num} appears in #{arr}"
else
  puts "The number #{last_num} does not appear in #{arr}"
end
