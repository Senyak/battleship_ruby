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
  f = Field.new
  puts "First, place your ships on the field, follow the rules"
  puts "  "

  while f.available_ships_quantity > 0
    f.available_ships_getter
    p "Enter your ship, where range in format 'A2:A4' (for single-deck range A1:A1):"
    input = gets.chomp
    f.add_ship(input)
    f.show_field
  end


  puts "Finally you placed your ships!"
end


