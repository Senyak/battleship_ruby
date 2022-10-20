
class InvalidLocShip < RuntimeError; end

class Ship

  def initialize(l,x1, y1, x2, y2, f)
    @lenght = l
    @space_ship = [x1, y1, x2, y2]
    @field = f

    new_state_of_field
  end

  def new_state_of_field
    for j in @space_ship[0]..@space_ship[2]
      for i in @space_ship[1]..@space_ship[3]
        throw InvalidLocShip if @field[i,j] == 2 or @field[i,j] == 1

        @field[i,j] = 2
      end
    end

    a1 = 0
    b1 = 0
    a2 = 0
    b2 = 0

    if @space_ship[0] == 0
      a1 = @space_ship[0]
    else
      a1 = @space_ship[0]-1
    end

    if @space_ship[2] == 9
      b1 = @space_ship[2]
    else
      b1 = @space_ship[2]+1
    end

    if @space_ship[1] == 0
      a2 = @space_ship[1]
    else
      a2 = @space_ship[1]-1
    end

    if  @space_ship[3] == 9
      b2 = @space_ship[3]
    else
      b2 = @space_ship[3]+1
    end

    for j in a1..b1
      for i in a2..b2
        @field[i,j] = 1 if @field[i,j] != 2
      end
    end

  end

end