=begin
  - split string and assign to an array
  - IF array is empty
    - RETURN an empty string
  - RETURN reversed_string using the reverse and join methods chained

=end

def reverse_sentence(string)
  string_arr = string.split
  return '' if string_arr.empty?

  string_arr.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''