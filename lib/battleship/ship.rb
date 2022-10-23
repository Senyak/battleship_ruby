
class InvalidLocShip < StandardError; end

class Ship
  def initialize(l,y1, y2, x1, x2, f)
    @origin_length = l
    @real_time_length = l
    @space_ship = [ x1, y1, x2, y2]
    @u_field = f
    begin
    new_state_of_field
    rescue InvalidLocShip => el
      puts el.message
    end
  end

  def origin_length_getter
    @origin_length
  end

  def new_state_of_field

    #adding ship on field
    for i in @space_ship[0]..@space_ship[2]
      for j in @space_ship[1]..@space_ship[3]
        raise InvalidLocShip.new "Oh no, it looks like the ship won't fit in here\n\n" if @u_field.field_getter[i,j] == 2 or @u_field.field_getter[i,j] == 1

        @u_field.field_setter(i,j,2)
      end
    end

    #adding space around ship on field
    a1 = 0
    b1 = 9
    a2 = 0
    b2 = 9

    a1 = @space_ship[0]-1 if @space_ship[0] != 0
    b1 = @space_ship[2]+1 if @space_ship[2] != 9
    a2 = @space_ship[1]-1 if @space_ship[1] != 0
    b2 = @space_ship[3]+1 if  @space_ship[3] != 9

    for i in a1..b1
      for j in a2..b2
        @u_field.field_setter(i,j,1) if @u_field.field_getter[i,j] != 2
      end
    end
  end

  def changing_length
    @real_time_length = @real_time_length - 1
  end

end
