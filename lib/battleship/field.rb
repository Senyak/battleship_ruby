require "matrix"

class InvalidShip < StandardError; end
class Field
  def initialize
    @field = Matrix::zero(10)
    @available_ships = [4, 3, 2, 1]
  end

  def field_getter
    @field
  end

  def field_setter(x,y,v)
    @field[x,y] = v
  end

  def available_ships_quantity
    @available_ships.sum
  end

  def available_ships_getter
    puts "Available ships:"
    puts "  #{@available_ships[0]} single-deck"
    puts "  #{@available_ships[1]} double-deck"
    puts "  #{@available_ships[2]} three-deck"
    puts "  #{@available_ships[3]} four-deck"
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
  def show_field_a
    for i in 0..10 do
      for j in 0..10 do
        print " — " if @field[i,j] == 0
        print " ☓ " if @field[i,j] == 1
        print " ☐ " if @field[i,j] == 2
      end
      puts " "
    end
  end

  def show_field
    for i in 0..10 do
      for j in 0..10 do
        print " — " if @field[i,j] == 0 or @field[i,j] == 1
        print " ☐ " if @field[i,j] == 2
        print " ◯ " if @field[i,j] == -1
        print " ☒ " if @field[i,j] == -2
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

  def changing_available_ships(l)
    @available_ships[l-1] = @available_ships[l-1] - 1
  end

  def add_ship (pos)
    m = pos.upcase.match( /(?<y1>[A-J])(?<x1>\d+):(?<y2>[A-J])(?<x2>\d+)/ )

    if m.nil? or !(m['y1'] == m['y2'] or m['x1'] == m['x2']) 
      raise InvalidShip.new "Oh no, there seems to be something wrong with your ship\n\n"
    end
    length = 0
    length = (m['x1'].to_i - m['x2'].to_i ).abs+1 if m['y1']==m['y2']
    length = (to_int(m['y1']) - to_int( m['y2']) ).abs+1 if m['x1']==m['x2']
    if length>4 || @available_ships[length-1]==0
      raise InvalidShip.new "Oh no, there seems to be something wrong with your ship\n\n"
    end

    y1 = to_int(m['y1'])-1
    y2 = to_int(m['y2'])-1
    x2 = m['x2'].to_i-1
    x1 = m['x1'].to_i-1

    x1, x2 = x2, x1 if x1> x2
    y1, y2 = y2, y1 if y1> y2

    if x1<0 or y1<0 or x2>9 or y2>9
      raise InvalidShip.new "Oh no, there seems to be something wrong with your ship\n\n"
    end

    s = Ship.new(length, y1, y2, x1, x2, self)
    if s.goodship?
    #updating available ships
      changing_available_ships(s.origin_length_getter)
    end
  end

  #TODO delete_ship(pos)
end
