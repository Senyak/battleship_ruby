require "battleship/version"
require "battleship/ship"
require "battleship/field"
require "battleship/enemyfield"
require "battleship/board"
require "battleship/users_turn"
require_relative "./battleship/information"
class Error < StandardError; end

extend Inf

puts "Welcome to the Battleship! (Russian version)"
puts "For read rules use 'rules'"
puts "For read some information about game process use 'help'"
puts "For starting game use 'start'"


def start
  input = ''
  user_field = Field.new
  puts "First, place your ships on the field, follow the rules"
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
    user_field.show_field_a
  end
  exit if input == 'over'
  puts "Finally you placed your ships!"

  computer_field = Enemy_Field.new

  board = Board.new(user_field, computer_field)


  if !who_first?
    puts "Now it's computer turn"
    puts " "
    # TODO computer's turn
  end

  game_over = false
  while !game_over
    puts "Now it's your turn"
    puts " "
    game_over = user_turn(board)

    puts "Now it's computer turn"
    puts " "
    # TODO computer's turn
  end
end
