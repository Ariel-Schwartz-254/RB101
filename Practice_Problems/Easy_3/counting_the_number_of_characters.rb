=begin
  - Ask user for words
  - split words into arr
  - initialize a total variable
  - iterate over the split words arr
    - add length of each word to total
  - display result
=end

puts "Please write word or multiple words: "
user_input = gets.chomp

words = user_input.split
total = 0
words.each {|word| total += word.length}

puts "There are #{total} characters in \"#{user_input}\"."