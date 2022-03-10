GAME_COMPONANTS = { shortcuts: {  Rock: 'R',
                                  Paper: 'P',
                                  Scissors: 'Sc',
                                  Lizard: 'L',
                                  Spock: 'Sp' },
                    win_rules: {  Rock: ['Scissors', 'Lizard'],
                                  Paper: ['Rock', 'Spock'],
                                  Scissors: ['Paper', 'Lizard'],
                                  Lizard: ['Spock', 'Paper'],
                                  Spock: ['Scissors', 'Rock'] } }

def prompt(message)
  puts("=> #{message}")
end

def display_welcome_msg
  puts <<-MSG

    ------------------------------------------------
    Welcome to #{GAME_COMPONANTS[:shortcuts].keys.join(', ')}!
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
  if valid_shortcut?(input)
    convert_shortcut(input)
  else
    input
  end
end

def valid_shortcut?(shortcut)
  GAME_COMPONANTS[:shortcuts].values.include?(shortcut)
end

def convert_shortcut(string)
  GAME_COMPONANTS[:shortcuts].key(string).to_s
end

def valid_input?(input)
  GAME_COMPONANTS[:shortcuts].keys.include?(input.to_sym)
end

def validate_input
  input = ''
  loop do
    display_input_request()
    input = gets().chomp().capitalize()
    input = convert_if_shortcut(input)

    break if valid_input?(input)
    prompt("'#{input}' is not a valid choice.")
  end
  input
end

def display_choices(player, computer)
  puts <<-MSG
       Player  | Computer
     ---------------------
    |#{player.center(10)}|#{computer.center(10)}|
     ---------------------

  MSG
end

def win_round?(first, second)
  GAME_COMPONANTS[:win_rules][first.to_sym].include?(second)
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

def display_round_result(winner)
  case winner
  when "Player"
    prompt("Player wins the round")
  when "Computer"
    prompt("Computer wins the round")
  else
    prompt("It's a tie!")
  end
end

def display_scoreboard(player_score, computer_score)
  puts <<-SCOREBOARD
     
    First to 3 points is the winner:

      Player  | Computer
     -------------------
    |    #{player_score}    |    #{computer_score}    |
     -------------------

  SCOREBOARD
end

def win_check?(player_score, computer_score)
  player_score == 3 || computer_score == 3
end

def display_winner(player, computer)
  prompt("PLAYER IS VICTORIOUS!!!") if player == 3
  prompt("Computer got the best of you...") if computer == 3
end

display_welcome_msg

loop do
  player_score = 0
  computer_score = 0

  loop do
    display_scoreboard(player_score, computer_score)
    player_choice = validate_input()
    computer_choice = GAME_COMPONANTS[:shortcuts].keys.sample.to_s

    prompt("#{GAME_COMPONANTS[:shortcuts].keys.join(' ')}!")
    display_choices(player_choice, computer_choice)

    winner = evaluate_round(player_choice, computer_choice)
    display_round_result(winner)

    player_score += 1 if winner == 'Player'
    computer_score += 1 if winner == 'Computer'

    display_scoreboard(player_score, computer_score)

    if win_check?(player_score, computer_score)
      prompt("GAME OVER")
      display_winner(player_score, computer_score)
      break
    end

    prompt("Ready for the next round?")
    Time.new
    5.downto(1) do |i|
      puts i
      sleep 2
    end

    system "clear"
  end

  prompt("Would you like to play again?")
  answer = gets().chomp()
  break unless answer.downcase.start_with?('y')

  system "clear"
end

prompt("Thank you for playing #{GAME_COMPONANTS[:shortcuts].keys.join(', ')}.")
prompt("Live long, and prosper!")
