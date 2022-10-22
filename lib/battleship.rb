require "battleship/version"
require "battleship/ship"
require "battleship/field"

require_relative "./battleship/information"
class Error < StandardError; end

extend Inf

def start
  f = Field.new
  puts "For enter your ship use 'add_ship(range)', where range in format 'A2:A4', follow the rules"

end


  puts "Welcome to the Battleship! (Russian version)"
  puts "For read rules use 'rules'"
  puts "For starting rules use 'start'"