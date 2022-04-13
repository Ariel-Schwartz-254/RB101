=begin
  - IF boolean is true
    - RETURN num divided by 2
  ELSE
    - RETURN 0
=end

def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000