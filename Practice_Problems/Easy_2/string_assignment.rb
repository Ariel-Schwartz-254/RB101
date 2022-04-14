=begin
  we fist assign the local variable 'name' to the string object 'Bob'. 
  Then, we assign the local variable save_name to the local variable 'name'.
  'name' and 'save_name' are both pointing to the same object: the string 'Bob'
  We then call the upcase method on the local variable 'name' which distructively mutates the string object 'Bob' to 'BOB'
  Since both variables point to the mutated object, calling the puts method on them will print the same result twice "BOB"
=end