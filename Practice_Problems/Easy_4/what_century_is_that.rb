=begin
Write a method that takes a year as input and returns the century. 
The return value should be a string that begins with the century number, 
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. 
So, the years 1901-2000 comprise the 20th century.

- account for the first 3 centuries that have special endings
- create method that takes care of this
- def find_ending
- remainder = num % 10
- IF (11..19),include (num % 100)
  - 'th'
- elsif 1 
    - ending is 'st'
  - elsif 2
    - ending is 'nd'
  - elsif 3
    - 'rd'
  - else
    - 'th'
  

- Initialize century variable as 0
- IF num % 10 equals 0
  - century equals num / 100
- ELSE
  - century equals num / 100 + 1
- ending = find_ending
- RETURN num + ending

=end

def find_ending(num)
  remainder = num % 10
  if (11..19).include?(num % 100)
    'th'
  elsif remainder == 1
    'st'
  elsif remainder == 2
    'nd'
  elsif remainder == 3
    'rd'
  else
    'th'
  end
end

def century(year)
  century = nil
  if year % 10 == 0
    century = year / 100
  else
    century = (year / 100) + 1
  end
ending = find_ending(century)
century.to_s + ending
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'