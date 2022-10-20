require "battleship/version"

module Battleship
  class Error < StandardError; end
  extend self

  def rules
    puts "Rules of the game"
    puts "The goal of the game is to *sink* all the ships on the playing field."
    puts "The playing field is a square consisting of 10 rows of 10 columns."
    puts "The rows are indicated by letters of the alphabet from A to J, and the columns are Arabic numerals from 1 to 10."
    puts "   "
    puts "Ships are randomly located on the playing field:"
    puts "  4 single-deck"
    puts "  3 double-deck"
    puts "  2 three-deck"
    puts "  1 four-deck"
    puts "On the field, the contact of neighboring ships with corners and sides is not allowed."
    puts "Ships can only be one continuous line, positioned horizontally or vertically, but never diagonally."
    puts "   "
    puts "During the game, the user makes a shot (indicates the coordinates on the playing field)."
    puts "If the user misses, then the possibility of a shot passes to the computer."
    puts "If the user hits the ship, then he can strike before the first miss."
    puts "   "
    puts "Help with the game process"
    puts "You will start by putting up your ships"
    puts "You should specify the range of the ship (for example 'A2:A4' or 'A2:B2')"
    puts "After you have placed all the boats, it will be randomly determined who will start the game"
    puts "When it's your turn, you will enter the place you want to check (for example 'C3')"
    puts "The program will tell you if you hit one of the computer's ships or missed:"
    puts "  a miss - '.'"
    puts "  hit - 'x'"
    puts "  untouched place - '_'"
    puts "At the end of the game, the program will tell you who won"
  end



  def hello
    'hello'
  end

end

  Battleship.rules
