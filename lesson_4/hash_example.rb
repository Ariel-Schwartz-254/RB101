produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  fruit = {}
  items = hash.keys
  counter = 0

  loop do
    break if counter == items.length
    if hash[items[counter]] == 'Fruit'
      fruit[items[counter]] = 'Fruit'
    end
    counter += 1
  end
  fruit
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
