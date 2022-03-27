INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  puts <<-GAME_BOARD
    Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}
    
         |     |
      #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
         |     |
    -----+-----+-----
         |     |
      #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
         |     |
    -----+-----+-----
         |     |
      #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
         |     |
    
  GAME_BOARD
end

def display_score(scoreboard, starting_player)
  puts <<-SCOREBOARD
    Starting Player: #{starting_player}

      Player    Computer
    +---------+---------+
    |    #{scoreboard[0]}    |    #{scoreboard[1]}    |
    +---------+---------+
    First player to 5 wins the game

  SCOREBOARD
end

def display_score_and_board(score, starting_player, brd)
  system 'clear'
  display_score(score, starting_player)
  display_board(brd)
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  new_arr = []
  arr.each { |element| new_arr << element }
  case new_arr.size
  when 0 then ''
  when 1 then new_arr.first
  when 2 then new_arr.join(" #{word} ")
  else
    new_arr[-1] = "#{word} #{arr.last}"
    new_arr.join(delimiter)
  end
end

def select_starting_player
  starting_player = ''
  loop do
    options = ['1', '2', '3']
    prompt "Please select who will go first: 1) Player 2) Computer 3) Random"
    prompt "(Select #{joinor(options)})"

    starting_player = gets.chomp
    break if options.include?(starting_player)

    prompt "Invalid option!"
  end
  starting_player
end

def convert_to_str(user_selection)
  case user_selection
  when "1"
    "Player"
  when "2"
    "Computer"
  when "3"
    ["Player", "Computer"].sample
  end
end

def find_at_risk_square(brd, marker)
  square = false
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(" ") == 1
      square = brd.select { |k, v| line.include?(k) && v == " " }.keys.first
    end
  end
  square
end

def defense(brd)
  find_at_risk_square(brd, PLAYER_MARKER)
end

def offense(brd)
  find_at_risk_square(brd, COMPUTER_MARKER)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  attack = offense(brd)
  defend = defense(brd)
  if attack
    brd[attack] = COMPUTER_MARKER
  elsif defend
    brd[defend] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    brd[empty_squares(brd).sample] = COMPUTER_MARKER
  end
end

def place_piece!(brd, current_player)
  player_places_piece!(brd) if current_player == "Player"
  computer_places_piece!(brd) if current_player == "Computer"
end

def alternate_player(current_player)
  if current_player == "Player"
    "Computer"
  else
    "Player"
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
    line.map
  end
  nil
end

def update_score(brd, scoreboard)
  scoreboard[0] += 1 if detect_winner(brd) == "Player"
  scoreboard[1] += 1 if detect_winner(brd) == "Computer"
end

def game_over?(scoreboard)
  scoreboard[0] == 5 || scoreboard[1] == 5
end

def display_winner(scoreboard)
  if scoreboard[0] == 5
    puts "Player wins the game!"
  else
    puts "Computer wins the game..."
  end
end

loop do
  scoreboard = [0, 0]
  starting_player = convert_to_str(select_starting_player)

  loop do
    board = initialize_board
    current_player = starting_player
    loop do
      display_score_and_board(scoreboard, starting_player, board)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_score_and_board(scoreboard, starting_player, board)
    if someone_won?(board)
      prompt "#{detect_winner(board)} wins the round!"
      update_score(board, scoreboard)
    else
      prompt "It's a tie!"
    end

    sleep 3

    if game_over?(scoreboard)
      display_winner(scoreboard)
      break
    end
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tic tac toe. Goodbye!"
