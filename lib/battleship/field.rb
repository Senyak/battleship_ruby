require "matrix"


class InvalidShip < RuntimeError; end

class Field
  def initialize
    @field = Matrix::zero(10)
    @availableships = [4,3,2,1]
  end

  def field_getter
    @field
  end

  def to_int(str)
    case str
    when 'A' then return 1
    when 'B' then return 2
    when 'C' then return 3
    when 'D' then return 4
    when 'E' then return 5
    when 'F' then return 6
    when 'G' then return 7
    when 'H' then return 8
    when 'I' then return 9
    else return 10
    end
  end
  def show_field
    for i in 0..10 do
      for j in 0..10 do
        print " #{@field[i,j]} "
      end
      puts " "
    end
  end
  def clean_field
    for i in 0..10 do
      for j in 0..10 do
        @field[i,j] = 0
      end
    end
  end

  def add_ship (pos)
    m = pos.match( /(?<y1>[A-J])(?<x1>\d+):(?<y2>[A-J])(?<x2>\d+)/ )
    if m['y1']!=m['y2'] or m['x1']!=m['x2']
      throw InvalidShip
    end
    length = 0
    length = (m['x1'].to_i - m['x2'].to_i ).abs+1 if m['y1']==m['y2']
    length = (to_int(m['y1']) - to_int( m['y2']) ).abs+1 if m['x1']==m['x2']
    if length>4 || @availableships[length]==0
      throw InvalidShip
    end



    #TODO доделать добавление кораблей
  end
end
