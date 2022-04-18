def palindromic_number?(num)
  num == num.to_s.reverse.to_i
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(050) == true