SUITS = %w(H D C S)
VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
GAME_LIMIT = 21
DEALER_LIMIT = 17

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome_msg
  system 'clear'
  prompt "Welcome to 21!"
  loop do
    prompt "Are you ready to play? (Y / N)"
    choice = gets.chomp
    break if choice.downcase.start_with?('y')

    prompt "OK... How aboout now?"
  end
end

def initialize_deck
  prompt "Shuffling deck..."
  sleep 1
  deck = []
  SUITS.each do
    VALUES.each do |value|
      deck << value
    end
  end
  deck.shuffle
end

def display_score(scoreboard)
  system 'clear'
  puts <<-SCOREBOARD

      Player     Dealer
    +---------+---------+
    |    #{scoreboard[0]}    |    #{scoreboard[1]}    |
    +---------+---------+
    First player to 5 wins the game

  SCOREBOARD
end

def deal_starting_cards(player, dealer, deck)
  prompt "Dealing cards..."
  sleep 1
  2.times do
    player << deck.pop
    dealer << deck.pop
  end
end

def joinand(arr)
  new_arr = []
  arr.each { |element| new_arr << element }
  case new_arr.length
  when 0
    new_arr
  when 1
    new_arr[0]
  when 2
    new_arr.join(' and ')
  else
    new_arr[-1] = 'and ' + new_arr[-1]
    new_arr.join(', ')
  end
end

def display_hands(player_hand, dealer_hand)
  prompt "Dealer hand: #{dealer_hand.first} and unknown card"
  prompt "Player hand: #{joinand(player_hand)}"
  prompt "  TOTAL VALUE: #{total(player_hand)}"
end

def display_final_hands(player_hand, dealer_hand)
  puts <<-FINAL_HANDS
    FINAL HANDS
    ===========
    Dealer hand: #{joinand(dealer_hand)}
    ------------
      TOTAL VALUE: #{total(dealer_hand)}

    Player hand: #{joinand(player_hand)}
    ------------
      TOTAL VALUE: #{total(player_hand)}
  FINAL_HANDS
  sleep 5
end

def value(card)
  if card == 'Ace'
    11
  elsif card.to_i == 0
    10
  else
    card.to_i
  end
end

def adjust_aces(sum, hand)
  aces = hand.count("Ace")
  aces.times { sum -= 10 if sum > 21 }
  sum
end

def total(hand)
  sum = 0
  hand.each do |card|
    sum += value(card)
  end
  sum = adjust_aces(sum, hand)
end

def display_choice_request
  puts <<-HIT_OR_STAY
    What would you like to do?
    1: Hit
    2: Stay
    (Select 1 or 2)
  HIT_OR_STAY
end

def hit_or_stay
  choice = ''
  loop do
    display_choice_request
    choice = gets.chomp
    break if ['1', '2'].include?(choice)
    prompt "Invalid Choice!"
  end
  return 'Hit' if choice == '1'
  return 'Stay' if choice == '2'
end

def busted?(hand)
  total(hand) > GAME_LIMIT
end

def player_turn(hand, deck)
  loop do
    player_move = hit_or_stay
    if player_move == 'Hit'
      hand << deck.pop
      break if busted?(hand)
    else
      break
    end

    prompt "Player hand: #{joinand(hand)}"
    prompt "  Total value: #{total(hand)}"
  end
  system 'clear'
end

def dealer_turn(hand, deck)
  while total(hand) < DEALER_LIMIT
    prompt "Dealer hits!"
    hand << deck.pop
    prompt "Dealer hand: #{joinand(hand)}"
    prompt "  Total value: #{total(hand)}"
    sleep 1
  end
end

def player_won?(player_total, dealer_total)
  player_total > dealer_total
end

def dealer_won?(player_total, dealer_total)
  player_total < dealer_total
end

def display_final_score(scoreboard)
  prompt "FINAL SCORE:"
  display_score(scoreboard)
  if scoreboard[0] == 5
    prompt "Player wins the game!!!"
  else
    prompt "Dealer wins the game... Better luck next time!"
  end
end

def play_again?
  prompt "Would you like to play again? (Y / N)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

display_welcome_msg
loop do
  scoreboard = [0, 0]
  player = 0
  dealer = 1
  loop do
    loop do
      deck = initialize_deck
      player_hand = []
      dealer_hand = []
      deal_starting_cards(player_hand, dealer_hand, deck)

      display_score(scoreboard)
      display_hands(player_hand, dealer_hand)

      player_turn(player_hand, deck)
      if busted?(player_hand)
        prompt "Player busted!"
        prompt "Dealer wins..."
        scoreboard[dealer] += 1
        display_final_hands(player_hand, dealer_hand)
        break
      end

      dealer_turn(dealer_hand, deck)
      if busted?(dealer_hand)
        prompt "Dealer busted!"
        prompt "Player wins!!!"
        scoreboard[player] += 1
        display_final_hands(player_hand, dealer_hand)
        break
      end

      player_total = total(player_hand)
      dealer_total = total(dealer_hand)

      if player_won?(player_total, dealer_total)
        prompt "Player wins!!!"
        scoreboard[player] += 1
      elsif dealer_won?(player_total, dealer_total)
        prompt "Dealer wins..."
        scoreboard[dealer] += 1
      else
        prompt "It's a tie! Unbelievable!!!"
      end

      display_final_hands(player_hand, dealer_hand)
      break
    end

    break if scoreboard.include?(5)
  end

  display_final_score(scoreboard)
  break unless play_again?
end

prompt "Thank you for playing, goodbye!"
