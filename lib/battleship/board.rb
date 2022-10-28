require "matrix"
class InvalidEmmm < StandardError; end

class Board
  def initialize(u_f, c_f)
    #u_f.show_efield
    #puts ""
    #c_f.show_efield
    @u_field = u_f.field_getter
    @u_av_ships = 10
    @c_field = c_f.field_getter
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
    @u_field[x,y] = v
  end

  def board_setter_c(x,y,v)
    @c_field[x,y] = v
  end

  def dec_av_u
    @u_av_ships -= 1
  end

  def dec_av_c
    @c_av_ships -= 1
  end

  def update_board(new_u_f)
    @u_field = new_u_f
  end

  def show_board
    print "  |  A  B  C  D  E  F  G  H  I     ||    | A  B  C  D  E  F  G  H  I  J\n"
    for i in 0..9 do
      print "#{i+1} |" if i<9
      print "#{i+1}|" if i==9
      for j in 0..9 do
        if @u_field[i,j] == 0 or @u_field[i,j] == 1
          print " — ".unicode_normalize
        elsif @u_field[i,j] == 2
          print " ☐ ".unicode_normalize
        elsif @u_field[i,j] == -1
          print " ◯ ".unicode_normalize
        elsif @u_field[i,j] == -2
          print " ☒ ".unicode_normalize
        end
      end

      print '  ||  '

      print "#{i+1} |" if i<9
      print "#{i+1}|" if i==9

      for j in 0..9 do
        if @c_field[i,j] == -1
          print " ◯ ".unicode_normalize
        elsif @c_field[i,j] == -2
           print " ☒ ".unicode_normalize
        else
           print " — ".unicode_normalize
        end
      end

      puts " "
    end
  end

end
