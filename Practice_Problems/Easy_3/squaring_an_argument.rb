def multiply(a, b)
  a * b
end

def square(num)
  multiply(num,num)
end

def power_to(num, power)
result = 1
  power.times do
    result = multiply(result, num)
  end
  result
end

p square(5) == 25
p square(-8) == 64

p power_to(2,3)