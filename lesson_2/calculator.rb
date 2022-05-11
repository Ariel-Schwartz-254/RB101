# frozen_string_literal: true

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(number)
  integer?(number) || float?(number)
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def operation_to_message(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])
name = ''
loop do
  name = Kernel.gets.chomp
  if name.empty?
    prompt(MESSGAES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets.chomp

    if number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets.chomp

    if number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform? 
    1) Add 
    2) Subtract
    3) Multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operation = ''
  loop do
    operation = Kernel.gets.chomp
    if %w[1 2 3 4].include?(operation)
      break
    else
      prompt('Must choose 1,2,3 or 4')
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result = case operation
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is: #{result}")
  prompt(MESSAGES['again'])
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])
