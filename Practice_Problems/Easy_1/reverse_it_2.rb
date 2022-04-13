=begin
  - split string into arr
  - iterate over arr
    - IF length of string is 5 or more
      - reverse the string
    ELSE
      - return string as is
  - RETURN the new arr using join
=end

def reverse_words(string)
  string_arr = string.split
  string_arr.map! do |str|
    if str.length >= 5
      str.reverse
    else
      str
    end
  end
  string_arr.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS