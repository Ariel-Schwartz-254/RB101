=begin
  We first initialize array1 and populate it with names. array2 is initialized as an empty array.
  We then call the each method on array1 and pass in a block that adds each value in array1 to array2.
  At this point, array1 and array2 are pointing to the same elements that have the same object ID.
  We then call the each method on array1 again this time passing in a block that destructively mutates all elements that fulfill a condition.
  If an element starts with the letter 'C' or 'S', we call upcase! on the name.
  So right now both arrays have certain elements in upper case letters
  specifically, CURLY SHEMP and CHICO
  so when we call the puts method on array2 the program prints:
  Moe
  Larry
  CURLY
  SHEMP
  Harpo 
  CHICO
  Groucho
  Zeppo

=end