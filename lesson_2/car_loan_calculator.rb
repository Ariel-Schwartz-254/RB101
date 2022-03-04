# frozen_string_literal: true

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

def valid_apr?(apr)
  apr.to_i.positive? && valid_number?(apr)
end

def input_loan_amount
  prompt('Please enter loan amount:')
  loan_amount = ''

  loop do
    loan_amount = gets.chomp
    return loan_amount if valid_number?(loan_amount)

    prompt('Invalid input! Please only enter a number')
  end
end

def input_apr
  prompt('Please enter Annual Percentage Rate (APR). (e.g 5 for 5%, 7.5 for 7.5%):')
  apr = ''
  loop do
    apr = gets.chomp
    return apr if valid_apr?(apr)

    prompt('Invalid APR! Please enter Annual Percentage Rate (APR) as a full number. (enter 5 for 5% or 7.5 for 7.5%)')
  end
end

def input_loan_duration
  prompt('Please enter loan duration in years:')
  loan_duration_years = ''
  loop do
    loan_duration_years = gets.chomp
    return loan_duration_years if valid_number?(loan_duration_years)
  end
end

def payment_calculator(amount, interest, duration)
  amount * (interest / (1 - (1 + interest)**-duration))
end

puts <<-WELCOME

  -------------------------------
  Welcome to car loan calculator!
  -------------------------------

WELCOME

loop do
  loan_amount = input_loan_amount
  apr = input_apr
  loan_duration_years = input_loan_duration

  monthly_intererst_rate = apr.to_f / 12 / 100
  loan_duration_months = loan_duration_years.to_f * 12

  monthly_payment = payment_calculator(loan_amount.to_f, monthly_intererst_rate, loan_duration_months)

  puts <<-RESULT
    Based on the provided information:
    You will pay $#{monthly_payment.round(2)} per month for #{loan_duration_years} years.

  RESULT

  prompt('Would you like another quote? (Y to continue)')
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
