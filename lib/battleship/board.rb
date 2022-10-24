require "matrix"
class InvalidEmmm < StandardError; end

class Board
  def initialize(u_f, c_f)
    @u_field = u_f
    @u_av_ships = 10
    @c_field = c_f
    @c_av_ships = 10
  end

  def board_getter_u
    @u_field
  end

  def board_getter_c
    @c_field
  end

  def av_getter_u
    @u_av_ships
  end

  def av_getter_c
    @c_av_ships
  end

  def board_setter_u(x,y,v)
    @u_field.field_setter(x,y,v)
  end

  def board_setter_c(x,y,v)
    @c_field.field_setter(x,y,v)
  end

  def dec_av_u
    @u_av_ships
  end

  def dec_av_c
    @c_av_ships
  end

  def show_board
    for i in 0..10 do
      for j in 0..10 do
        if @u_field[i,j] == 0
          print " — "
        elsif @u_field[i,j] == -1
          print " ◯ "
        elsif @u_field[i,j] == -2
          print " ☒ "
        end
      end

      print "  ||  "

      for j in 0..10 do
        if @c_field[i,j] == -1
          print " ◯ "
        elsif @c_field[i,j] == -2
           print " ☒ "
        else
           print " — "
        end
        end
      puts " "
    end
  end

end
