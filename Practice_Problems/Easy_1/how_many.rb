=begin

Write a method that counts the number of occurrences of each element in a given array.
expected output: 
car => 4
truck => 3
SUV => 1
motorcycle => 2

- create empty result hash
- for each element in the vehicles arr
  - IF Already in arr
    - add 1 to current value
  - ELSE
    - create new key with value of 1

=end

def count_occurrences(vehicles)
  vehicle_count = {}
  vehicles.each do |vehicle|
    if vehicle_count.keys.include?(vehicle.downcase)
      vehicle_count[vehicle.downcase] += 1
    else
      vehicle_count[vehicle.downcase] = 1
    end
  end
  vehicle_count.each { |vehicle, count| puts "#{vehicle} => #{count}" }
 
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)