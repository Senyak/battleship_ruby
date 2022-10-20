
class InvalidLocShip < RuntimeError; end

class Ship

  def initialize(l,x1, y1, x2, y2, f)
    @lenght = l
    @space_ship = [x1, y1, x2, y2]
    @field = f
  end

  def new_state_of_field
    for i in @space_ship[0]...@space_ship[2]
      for j in @space_ship[1]...@space_ship[3]
        throw InvalidLocShip if @field[i,j] == 2 or @field[i,j] == 1

        @field[i,j] = 2
      end
    end

    for i in @space_ship[0]-1...@space_ship[2]+1
      for j in @space_ship[1]-1...@space_ship[3]+1
        @field[i,j] = 1 if @field[i,j] != 2
      end
    end

  end

end