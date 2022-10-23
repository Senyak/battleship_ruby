require "battleship/version"
require "battleship/ship"
require "battleship/field"

require_relative "./battleship/information"
class Error < StandardError; end

extend Inf

puts "Welcome to the Battleship! (Russian version)"
puts "For read rules use 'rules'"
puts "For read some information about game process use 'help'"
puts "For starting game use 'start'"


def start

  user_field = Field.new
  puts "First, place your ships on the field, follow the rules"
  puts "  "

  while user_field.available_ships_quantity > 0
    user_field.available_ships_getter
    p "Enter your ship, where range in format 'A2:A4' (for single-deck range A1:A1):"
    user_field.add_ship( gets.chomp)
    user_field.show_field
  end

  puts "Finally you placed your ships!"

  computer_field = Enemy_Field.new.field_getter


  if !who_first?
    # TODO computer's turn
  end

  game_over = false
  while !game_over
    # TODO user's turn
    # TODO computer's turn
  end
end


