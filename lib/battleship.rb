require "battleship/version"
require "battleship/ship"
require "battleship/field"
require "battleship/enemyfield"
require "battleship/board"
require "battleship/users_turn"
require_relative "./battleship/information"
class Error < StandardError; end

extend Inf

=begin
def beg
  com = ''
  com = gets.chomp
  until com == 'rules' or com == 'help' or com == 'start'

    if com == 'rules'
      rules
    elsif com == 'help'
      help
    elsif com != 'start'
      start
    else
      com = gets.chomp
    end
  end
end
=end

puts "Welcome to the Battleship! (Russian version)"
sleep(1)
puts "For read rules use 'rules'"
puts "For read some information about game process use 'help'"
puts "For starting game use 'start'"

#beg


def start
  input = ''
  user_field = Field.new
  puts "First, place your ships on the field, follow the rules"
  puts "  "
  puts "Would you like to place the ships on your own or rely on random generation?"

  until input.downcase == "m" or input.downcase == "r"

    puts "  M[by my own]/R[random]:  "
    input = gets.chomp
    flag = false

    if input.downcase == "m"
      puts "     "
      sleep(1)
      puts "You chose to arrange manually "
      puts "  "

      while user_field.available_ships_quantity > 0
        user_field.available_ships_getter
        p "Enter your ship, where range in format 'A2:A4' (for single-deck range A1:A1):"
        begin
          input = gets.chomp
          exit if input == 'over'
          user_field.add_ship(input)
        rescue InvalidShip => e
          puts e.message
        end
        user_field.show_field
        sleep(0.5)
      end
    else
      puts "     "
      sleep(1)
      puts "You chose automatic placement "
      puts "  "

      while input.downcase != 'yes' or input.downcase != 'y' or input.downcase != 'no' or input.downcase != 'n'
        user_field = Enemy_Field.new
        user_field.show_field
        puts "Is this placement suitable for you?"
        puts "  Y[yes]/N[no]:"

        input = gets.chomp
        if input.downcase == 'yes' or input.downcase == 'y'
          flag = true
          break
        end
      end

      break if flag
    end

  end



  exit if input == 'over'

  computer_field = Enemy_Field.new


  puts "Finally you placed your ships!"

  board = Board.new(user_field, computer_field)

  puts "Now it will be decided who will go first."
  sleep(1)

  wh = who_first?
  if wh
    puts "Computer will go first"
  else
    puts "You will go first"
  end

  sleep(1)

  e = Enemy.new(board.board_getter_u, board.board_getter_c, board)


  if wh
    puts "Now it's computer turn"
    puts " "
    e.attack
    sleep(1)
  end

  game_over = true
  who_win = true

  while game_over
    puts "Now it's your turn"
    puts " "
    user_turn(board)
    if board.av_getter_c == 0
      game_over = false
      who_win = true
      break
    end

    sleep(1)

    puts "Now it's computer turn"
    puts " "
    e.attack

    if board.av_getter_u == 0
      game_over = false
      who_win = false
      break
    end

    sleep(1)
  end

  if who_win
    puts "Congratulations! You have won!"
  else
    puts "This time the machine was smarter... Better luck next time"
  end

  again
end

def again
  puts "    "
  puts "Do you want to play again?"
  sleep(1)
  answ = ''
  until answ.downcase == 'yes' or answ.downcase == 'y' or answ.downcase == 'no' or answ.downcase == 'n'
    puts "  Y[yes]/N[no]: "
    answ = gets.chomp
    if answ.downcase == 'yes' or answ.downcase == 'y'
      puts "Okey, let's start again!"
      start
    elsif answ.downcase == 'no' or answ.downcase == 'n'
      puts "Thank you for your time! Favorable wind to you!"
    end
  end
end