def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def valid_amount?(amount)
  valid_number?(amount) && amount.to_i.positive?
end

def valid_apr?(apr)
  valid_number?(apr) && apr.to_i >= 0
end

def input_principle
  prompt('Please enter loan amount:')
  principle = ''

  loop do
    principle = gets.chomp
    return principle if valid_amount?(principle)

    prompt('Invalid input! Please only enter a positive number.')
  end
end

def input_apr
  prompt('Please enter Annual Percentage Rate (APR):')
  prompt('Enter 5 for 5% or 7.5 for 7.5%)')
  apr = ''
  loop do
    apr = gets.chomp
    return apr if valid_apr?(apr)

    prompt('Invalid APR! Please enter APR as a full number.')
    prompt('Enter 5 for 5% or 7.5 for 7.5%)')
  end
end

def input_term
  prompt('Please enter loan term in years:')
  term_years = ''
  loop do
    term_years = gets.chomp
    return term_years if valid_amount?(term_years)

    prompt('Invalid input! Please only enter a positive number.')
  end
end

def payment_calc(amount, interest, duration)
  amount * (interest / (1 - (1 + interest)**-duration))
end

puts <<-WELCOME

  -------------------------------
  Welcome to car loan calculator!
  -------------------------------

WELCOME

loop do
  principle = input_principle
  apr = input_apr
  term_years = input_term

  monthly_int_rate = apr.to_f / 12 / 100
  term_months = term_years.to_f * 12

  monthly_payment = payment_calc(principle.to_f, monthly_int_rate, term_months)

  puts <<-RESULT
    Based on the provided information:
    You will pay $#{format('%.2f', monthly_payment)} per month for #{term_years} years.

  RESULT

  prompt('Would you like another quote? (Y to continue)')
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
