VALID_CHOICES = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']
WIN_RULES = { Rock: ['Scissors', 'Lizard'],
              Paper: ['Rock', 'Spock'],
              Scissors: ['Paper', 'Lizard'],
              Lizard: ['Spock', 'Paper'],
              Spock: ['Scissors', 'Rock'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_welcome_msg
  puts <<-MSG

    ------------------------------------------------
    Welcome to #{VALID_CHOICES.join(', ')}!
    ------------------------------------------------

  MSG
end

def display_input_request
  puts <<-MSG
    Choose one: (You may use the shortcuts in brackets)
    Rock (r)
    Paper (p)
    Scissors (sc)
    Lizard (l)
    Spock (sp)
  MSG
end

def convert_if_shortcut(input)
  if input.length <= 2
    convert_shortcut(input)
  else
    input
  end
end

def valid_input?(input)
  VALID_CHOICES.include?(input)
end

def convert_shortcut(string)
  case string
  when 'R'
    'Rock'
  when 'P'
    'Paper'
  when 'Sc'
    'Scissors'
  when 'L'
    'Lizard'
  when 'Sp'
    'Spock'
  else
    string
  end
end

def validate_input
  input = ''
  loop do
    display_input_request()
    input = Kernel.gets().chomp().capitalize()
    input = convert_if_shortcut(input)

    break if valid_input?(input)
    prompt("'#{input}' is not a valid choice.")
  end
  input
end

def display_choices(player, computer)
  puts <<-MSG
     Player           Computer
    --------        ------------
    #{player}            #{computer}

  MSG
end

def win_round?(first, second)
  WIN_RULES[first.to_sym].include?(second)
end

def evaluate_round(player, computer)
  if win_round?(player, computer)
    "Player"
  elsif win_round?(computer, player)
    "Computer"
  else
    "Tie"
  end
end

def display_round_result(result)
  case result
  when "Player"
    prompt("Player's round")
  when "Computer"
    prompt("Computer's round")
  else
    prompt("It's a tie!")
  end
end

def display_scoreboard(player, computer)
  puts <<-SCOREBOARD
     
      Player  | Computer
     -------------------
    |    #{player}    |    #{computer}    |
     -------------------

  SCOREBOARD
end

def win_check?(player, computer)
  player == 3 || computer == 3
end

def display_winner(player, computer)
  prompt("PLAYER IS VICTORIOUS!!!") if player == 3
  prompt("Computer got the best of you...") if computer == 3
end

display_welcome_msg

loop do
  player_score = 0
  computer_score = 0
  display_scoreboard(player_score, computer_score)

  loop do
    player_choice = validate_input()
    computer_choice = VALID_CHOICES.sample

    prompt("#{VALID_CHOICES.join(' ')}!")
    display_choices(player_choice, computer_choice)

    winner = evaluate_round(player_choice, computer_choice)
    display_round_result(result)

    player_score += 1 if winner == 'Player'
    computer_score += 1 if winner == 'Computer'

    display_scoreboard(player_score, computer_score)

    if win_check?(player_score, computer_score)
      prompt("GAME OVER")
      display_winner(player_score, computer_score)
      break
    end

    loop do
      prompt("Ready for the next round? (Press Enter to continue)")
      Kernel.gets().chomp()
      break
    end

    system "clear"
  end

  prompt("Would you like to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing #{VALID_CHOICES.join(', ')}.")
prompt("Live long, and prosper!")
